#include <BRSHandShake.h>

#include <BRSErrorDef.h>
#include <openssl/evp.h>
#include <openssl/hmac.h>
#include <openssl/dh.h>

#define RFC2409_PRIME_1024 \
        "FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD1" \
        "29024E088A67CC74020BBEA63B139B22514A08798E3404DD" \
        "EF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245" \
        "E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7ED" \
        "EE386BFB5A899FA5AE9F24117C4B1FE649286651ECE65381" \
        "FFFFFFFFFFFFFFFF"

namespace BRS 
{
  
  // 68bytes FMS key which is used to sign the sever packet.
u_int8_t BrsGenuineFMSKey[] = {
    0x47, 0x65, 0x6e, 0x75, 0x69, 0x6e, 0x65, 0x20,
    0x41, 0x64, 0x6f, 0x62, 0x65, 0x20, 0x46, 0x6c,
    0x61, 0x73, 0x68, 0x20, 0x4d, 0x65, 0x64, 0x69,
    0x61, 0x20, 0x53, 0x65, 0x72, 0x76, 0x65, 0x72,
    0x20, 0x30, 0x30, 0x31, // Genuine Adobe Flash Media Server 001
    0xf0, 0xee, 0xc2, 0x4a, 0x80, 0x68, 0xbe, 0xe8,
    0x2e, 0x00, 0xd0, 0xd1, 0x02, 0x9e, 0x7e, 0x57,
    0x6e, 0xec, 0x5d, 0x2d, 0x29, 0x80, 0x6f, 0xab,
    0x93, 0xb8, 0xe6, 0x36, 0xcf, 0xeb, 0x31, 0xae
}; // 68

// 62bytes FP key which is used to sign the client packet.
u_int8_t BrsGenuineFPKey[] = {
    0x47, 0x65, 0x6E, 0x75, 0x69, 0x6E, 0x65, 0x20,
    0x41, 0x64, 0x6F, 0x62, 0x65, 0x20, 0x46, 0x6C,
    0x61, 0x73, 0x68, 0x20, 0x50, 0x6C, 0x61, 0x79,
    0x65, 0x72, 0x20, 0x30, 0x30, 0x31, // Genuine Adobe Flash Player 001
    0xF0, 0xEE, 0xC2, 0x4A, 0x80, 0x68, 0xBE, 0xE8,
    0x2E, 0x00, 0xD0, 0xD1, 0x02, 0x9E, 0x7E, 0x57,
    0x6E, 0xEC, 0x5D, 0x2D, 0x29, 0x80, 0x6F, 0xAB,
    0x93, 0xB8, 0xE6, 0x36, 0xCF, 0xEB, 0x31, 0xAE
}; // 62
  
  int openssl_HMACsha256(const void* data, int data_size, const void* key, int key_size, void* digest) {
    HMAC_CTX ctx;
    
    HMAC_CTX_init(&ctx);
    HMAC_Init_ex(&ctx, (unsigned char*) key, key_size, EVP_sha256(), NULL);
    HMAC_Update(&ctx, (unsigned char *) data, data_size);

    unsigned int digest_size;
    HMAC_Final(&ctx, (unsigned char *) digest, &digest_size);
    
    HMAC_CTX_cleanup(&ctx);
    
    if (digest_size != 32) {
        return ERROR_OpenSslSha256DigestSize;
    }
    
    return ERROR_SUCCESS;
}



	
int __openssl_generate_key(
	u_int8_t*& _private_key, u_int8_t*& _public_key, int32_t& size,
	DH*& pdh, int32_t& bits_count, u_int8_t*& shared_key, int32_t& shared_key_length, BIGNUM*& peer_public_key
){
	int ret = ERROR_SUCCESS;

    //1. Create the DH
    if ((pdh = DH_new()) == NULL) {
        ret = ERROR_OpenSslCreateDH; 
        return ret;
    }

    //2. Create his internal p and g
    if ((pdh->p = BN_new()) == NULL) {
        ret = ERROR_OpenSslCreateP; 
        return ret;
    }
    if ((pdh->g = BN_new()) == NULL) {
        ret = ERROR_OpenSslCreateG; 
        return ret;
    }

    //3. initialize p, g and key length
    if (BN_hex2bn(&pdh->p, RFC2409_PRIME_1024) == 0) {
        ret = ERROR_OpenSslParseP1024; 
        return ret;
    }
    if (BN_set_word(pdh->g, 2) != 1) {
        ret = ERROR_OpenSslSetG;
        return ret;
    }

    //4. Set the key length
    pdh->length = bits_count;

    //5. Generate private and public key
    if (DH_generate_key(pdh) != 1) {
        ret = ERROR_OpenSslGenerateDHKeys;
        return ret;
    }

    // CreateSharedKey
    if (pdh == NULL) {
        ret = ERROR_OpenSslGenerateDHKeys;
        return ret;
    }

    if (shared_key_length != 0 || shared_key != NULL) {
        ret = ERROR_OpenSslShareKeyComputed;
        return ret;
    }

    shared_key_length = DH_size(pdh);
    if (shared_key_length <= 0 || shared_key_length > 1024) {
        ret = ERROR_OpenSslGetSharedKeySize;
        return ret;
    }
    shared_key = new u_int8_t[shared_key_length];
    memset(shared_key, 0, shared_key_length);

    peer_public_key = BN_bin2bn(_private_key, size, 0);
    if (peer_public_key == NULL) {
        ret = ERROR_OpenSslGetPeerPublicKey;
        return ret;
    }

    if (DH_compute_key(shared_key, peer_public_key, pdh) == -1) {
        ret = ERROR_OpenSslComputeSharedKey;
        return ret;
    }

    // CopyPublicKey
    if (pdh == NULL) {
        ret = ERROR_OpenSslComputeSharedKey;
		return ret;
    }
    
    int32_t keySize = BN_num_bytes(pdh->pub_key);
    if ((keySize <= 0) || (size <= 0) || (keySize > size)) {
        //("CopyPublicKey failed due to either invalid DH state or invalid call"); return ret;
        ret = ERROR_OpenSslInvalidDHState; 
        return ret;
    }

    if (BN_bn2bin(pdh->pub_key, _public_key) != keySize) {
        //("Unable to copy key"); return ret;
        ret = ERROR_OpenSslCopyKey; 
        return ret;
    }
    
    return ret;
}
int openssl_generate_key(char* _private_key, char* _public_key, int32_t size)
{
    int ret = ERROR_SUCCESS;

    // Initialize
    DH* pdh = NULL;
    int32_t bits_count = 1024; 
    u_int8_t* shared_key = NULL;
    int32_t shared_key_length = 0;
    BIGNUM* peer_public_key = NULL;
    
    ret = __openssl_generate_key(
    	(u_int8_t*&)_private_key, (u_int8_t*&)_public_key, size,
    	pdh, bits_count, shared_key, shared_key_length, peer_public_key
    );
    
    if (pdh != NULL) {
        if (pdh->p != NULL) {
            BN_free(pdh->p);
            pdh->p = NULL;
        }
        if (pdh->g != NULL) {
            BN_free(pdh->g);
            pdh->g = NULL;
        }
        DH_free(pdh);
        pdh = NULL;
    }

    if (shared_key != NULL) {
        delete[] shared_key;
        shared_key = NULL;
    }

    if (peer_public_key != NULL) {
        BN_free(peer_public_key);
        peer_public_key = NULL;
    }

    return ret;
}

  
  // the digest key generate size.
#define OpensslHashSize 512

/**
* 764bytes key结构
* 	random-data: (offset)bytes
* 	key-data: 128bytes
* 	random-data: (764-offset-128-4)bytes
* 	offset: 4bytes
*/
struct key_block
{
	// (offset)bytes
	char* random0;
	int random0_size;
	
	// 128bytes
	char key[128];
	
	// (764-offset-128-4)bytes
	char* random1;
	int random1_size;
	
	// 4bytes
	int32_t offset;
};
  
// calc the offset of key,
// the key->offset cannot be used as the offset of key.
int brs_key_block_get_offset(key_block *key)
{
      int max_offset_size = 764 - 128 - 4;
      
      int offset = 0;
      u_int8_t * pp = (u_int8_t *)&key->offset;
      offset += *pp++;
      offset += *pp++;
      offset += *pp++;
      offset += *pp++;
      return offset % max_offset_size;
}
  
void brs_key_block_init(key_block * key)
{
      key->offset = (int32_t)rand();
      key->random0 = NULL;
      key->random1 = NULL;
      
      int offset = brs_key_block_get_offset(key);
      
      assert(offset >= 0);
      
      key->random0_size = offset;
      if(key->random0_size > 0)
      {
	  key->random0 = new char[key->random0_size];
	  for(int i =0 ; i < key->random0_size; i++ )
	     *(key->random0 +i ) = rand() % 256;
      }
      
      for (int i = 0; i < (int)sizeof(key->key); i++) {
		*(key->key + i) = rand() % 256;
	}
	
	key->random1_size = 764 - offset - 128 - 4;
	if (key->random1_size > 0) {
		key->random1 = new char[key->random1_size];
		for (int i = 0; i < key->random1_size; i++) {
			*(key->random1 + i) = rand() % 256;
		}
	}
      
  
}

// parse key block from c1s1.
// if created, user must free it by brs_key_block_free
// @c1s1_key_bytes the key start bytes, maybe c1s1 or c1s1+764
int brs_key_block_parse(key_block * key,char * c1s1_key_bytes)
{
      int ret = ERROR_SUCCESS;
      char * pp = c1s1_key_bytes + 764;
      pp-=sizeof(int32_t);
      key->offset = *(int32_t*)pp;
      
      key->random0 = NULL;
      key->random1 = NULL;
      
      pp = c1s1_key_bytes;
      
      int offset = brs_key_block_get_offset(key);
      assert(offset >= 0);
      
      key->random0_size = offset;
	if (key->random0_size > 0) {
		key->random0 = new char[key->random0_size];
		memcpy(key->random0, pp, key->random0_size);
	}
	pp += key->random0_size;
	
	memcpy(key->key, pp, sizeof(key->key));
	pp += sizeof(key->key);
	
	key->random1_size = 764 - offset - 128 - 4;
	if (key->random1_size > 0) {
		key->random1 = new char[key->random1_size];
		memcpy(key->random1, pp, key->random1_size);
	}
	
	return ret;
}
 
// free the block data create by 
// brs_key_block_init or brs_key_block_parse
void brs_key_block_free(key_block* key)
{
	if (key->random0) {
		SafeDelete(key->random0);
	}
	if (key->random1) {
		SafeDelete(key->random1);
	}
}

/**
* 764bytes digest结构
* 	offset: 4bytes
* 	random-data: (offset)bytes
* 	digest-data: 32bytes
* 	random-data: (764-4-offset-32)bytes
*/
struct digest_block
{
	// 4bytes
	int32_t offset;
	
	// (offset)bytes
	char* random0;
	int random0_size;
	
	// 32bytes
	char digest[32];
	
	// (764-4-offset-32)bytes
	char* random1;
	int random1_size;
};
// calc the offset of digest,
// the key->offset cannot be used as the offset of digest.
  int brs_digest_block_get_offset(digest_block* digest)
{
	int max_offset_size = 764 - 32 - 4;
	
	int offset = 0;
	u_int8_t* pp = (u_int8_t*)&digest->offset;
	offset += *pp++;
	offset += *pp++;
	offset += *pp++;
	offset += *pp++;

	return offset % max_offset_size;
}
// create new digest block data.
// if created, user must free it by brs_digest_block_free
void brs_digest_block_init(digest_block* digest)
{
	digest->offset = (int32_t)rand();
	digest->random0 = NULL;
	digest->random1 = NULL;
	
	int offset = brs_digest_block_get_offset(digest);
	assert(offset >= 0);
	
	digest->random0_size = offset;
	if (digest->random0_size > 0) {
		digest->random0 = new char[digest->random0_size];
		for (int i = 0; i < digest->random0_size; i++) {
			*(digest->random0 + i) = rand() % 256;
		}
	}
	
	for (int i = 0; i < (int)sizeof(digest->digest); i++) {
		*(digest->digest + i) = rand() % 256;
	}
	
	digest->random1_size = 764 - 4 - offset - 32;
	if (digest->random1_size > 0) {
		digest->random1 = new char[digest->random1_size];
		for (int i = 0; i < digest->random1_size; i++) {
			*(digest->random1 + i) = rand() % 256;
		}
	}
}
// parse digest block from c1s1.
// if created, user must free it by brs_digest_block_free
// @c1s1_digest_bytes the digest start bytes, maybe c1s1 or c1s1+764
int brs_digest_block_parse(digest_block* digest, char* c1s1_digest_bytes)
{
	int ret = ERROR_SUCCESS;

	char* pp = c1s1_digest_bytes;
	
	digest->offset = *(int32_t*)pp;
	pp += sizeof(int32_t);
	
	digest->random0 = NULL;
	digest->random1 = NULL;
	
	int offset = brs_digest_block_get_offset(digest);
	assert(offset >= 0);
	
	digest->random0_size = offset;
	if (digest->random0_size > 0) {
		digest->random0 = new char[digest->random0_size];
		memcpy(digest->random0, pp, digest->random0_size);
	}
	pp += digest->random0_size;
	
	memcpy(digest->digest, pp, sizeof(digest->digest));
	pp += sizeof(digest->digest);
	
	digest->random1_size = 764 - 4 - offset - 32;
	if (digest->random1_size > 0) {
		digest->random1 = new char[digest->random1_size];
		memcpy(digest->random1, pp, digest->random1_size);
	}
	
	return ret;
}
// free the block data create by 
// brs_digest_block_init or brs_digest_block_parse
void brs_digest_block_free(digest_block* digest)
{
	if (digest->random0) {
		SafeDelete(digest->random0);
	}
	if (digest->random1) {
		SafeDelete(digest->random1);
	}
}

/**
* the schema type.
*/
enum brs_schema_type {
	brs_schema0 = 0, // key-digest sequence
	brs_schema1 = 1, // digest-key sequence
	brs_schema_invalid = 2,
};

void __brs_time_copy_to(char*& pp, int32_t time)
{
	// 4bytes time
	*(int32_t*)pp = time;
	pp += 4;
}
void __brs_version_copy_to(char*& pp, int32_t version)
{
	// 4bytes version
	*(int32_t*)pp = version;
	pp += 4;
}
void __brs_key_copy_to(char*& pp, key_block* key)
{
	// 764bytes key block
	if (key->random0_size > 0) {
		memcpy(pp, key->random0, key->random0_size);
	}
	pp += key->random0_size;
	
	memcpy(pp, key->key, sizeof(key->key));
	pp += sizeof(key->key);
	
	if (key->random1_size > 0) {
		memcpy(pp, key->random1, key->random1_size);
	}
	pp += key->random1_size;
	
	*(int32_t*)pp = key->offset;
	pp += 4;
}
void __brs_digest_copy_to(char*& pp, digest_block* digest, bool with_digest)
{
	// 732bytes digest block without the 32bytes digest-data
	// nbytes digest block part1
	*(int32_t*)pp = digest->offset;
	pp += 4;
	
	if (digest->random0_size > 0) {
		memcpy(pp, digest->random0, digest->random0_size);
	}
	pp += digest->random0_size;
	
	// digest
	if (with_digest) {
		memcpy(pp, digest->digest, 32);
		pp += 32;
	}
	
	// nbytes digest block part2
	if (digest->random1_size > 0) {
		memcpy(pp, digest->random1, digest->random1_size);
	}
	pp += digest->random1_size;
}

/**
* copy whole c1s1 to bytes.
*/
void brs_schema0_copy_to(char* bytes, bool with_digest, 
	int32_t time, int32_t version, key_block* key, digest_block* digest)
{
	char* pp = bytes;

	__brs_time_copy_to(pp, time);
	__brs_version_copy_to(pp, version);
	__brs_key_copy_to(pp, key);
	__brs_digest_copy_to(pp, digest, with_digest);
	
	if (with_digest) {
		assert(pp - bytes == 1536);
	} else {
		assert(pp - bytes == 1536 - 32);
	}
}
void brs_schema1_copy_to(char* bytes, bool with_digest, 
	int32_t time, int32_t version, digest_block* digest, key_block* key)
{
	char* pp = bytes;

	__brs_time_copy_to(pp, time);
	__brs_version_copy_to(pp, version);
	__brs_digest_copy_to(pp, digest, with_digest);
	__brs_key_copy_to(pp, key);
	
	if (with_digest) {
		assert(pp - bytes == 1536);
	} else {
		assert(pp - bytes == 1536 - 32);
	}
}
/**
* c1s1 is splited by digest:
* 	c1s1-part1: n bytes (time, version, key and digest-part1).
* 	digest-data: 32bytes
* 	c1s1-part2: (1536-n-32)bytes (digest-part2)
*/
char* brs_bytes_join_schema0(int32_t time, int32_t version, key_block* key, digest_block* digest)
{
	char* bytes = new char[1536 -32];
	
	brs_schema0_copy_to(bytes, false, time, version, key, digest);
	
	return bytes;
}
/**
* c1s1 is splited by digest:
* 	c1s1-part1: n bytes (time, version and digest-part1).
* 	digest-data: 32bytes
* 	c1s1-part2: (1536-n-32)bytes (digest-part2 and key)
*/
char* brs_bytes_join_schema1(int32_t time, int32_t version, digest_block* digest, key_block* key)
{
	char* bytes = new char[1536 -32];
	
	brs_schema1_copy_to(bytes, false, time, version, digest, key);
	
	return bytes;
}

/**
* compare the memory in bytes.
*/
bool brs_bytes_equals(void* pa, void* pb, int size){
	u_int8_t* a = (u_int8_t*)pa;
	u_int8_t* b = (u_int8_t*)pb;
	
    for(int i = 0; i < size; i++){
        if(a[i] != b[i]){
            return false;
        }
    }

    return true;
}

/**
* c1s1 schema0
* 	time: 4bytes
* 	version: 4bytes
* 	key: 764bytes
* 	digest: 764bytes
* c1s1 schema1
* 	time: 4bytes
* 	version: 4bytes
* 	digest: 764bytes
* 	key: 764bytes
*/
struct c1s1
{
	union block {
		key_block key; 
		digest_block digest; 
	};
	
	// 4bytes
	int32_t time;
	// 4bytes
	int32_t version;
	// 764bytes
	// if schema0, use key
	// if schema1, use digest
	block block0;
	// 764bytes
	// if schema0, use digest
	// if schema1, use key
	block block1;
	
	// the logic schema
	brs_schema_type schema;
	
	c1s1();
	virtual ~c1s1();
	/**
	* get the digest key.
	*/
	virtual char* get_digest();
	/**
	* copy to bytes.
	*/
	virtual void dump(char* _c1s1);
	
	/**
	* client: create and sign c1 by schema.
	* sign the c1, generate the digest.
	* 		calc_c1_digest(c1, schema) {
    *			get c1s1-joined from c1 by specified schema
    *			digest-data = HMACsha256(c1s1-joined, FPKey, 30)
    *			return digest-data;
	*		}
	*		random fill 1536bytes c1 // also fill the c1-128bytes-key
	*		time = time() // c1[0-3]
	*		version = [0x80, 0x00, 0x07, 0x02] // c1[4-7]
	*		schema = choose schema0 or schema1
	*		digest-data = calc_c1_digest(c1, schema)
	*		copy digest-data to c1
	*/
	virtual int c1_create(brs_schema_type _schema);
	/**
	* server: parse the c1s1, discovery the key and digest by schema.
	* use the c1_validate_digest() to valid the digest of c1.
	*/
	virtual int c1_parse(char* _c1s1, brs_schema_type _schema);
	/**
	* server: validate the parsed schema and c1s1
	*/
	virtual int c1_validate_digest(bool& is_valid);
	/**
	* server: create and sign the s1 from c1.
	*/
	virtual int s1_create(c1s1* c1);
private:
	virtual int calc_s1_digest(char*& digest);
	virtual int calc_c1_digest(char*& digest);
	virtual void destroy_blocks();
};

/**
* the c2s2 complex handshake structure.
* random-data: 1504bytes
* digest-data: 32bytes
*/
struct c2s2
{
	char random[1504];
	char digest[32];
	
	c2s2();
	virtual ~c2s2();
	
	/**
	* copy to bytes.
	*/
	virtual void dump(char* _c2s2);

	/**
	* create c2.
	* random fill c2s2 1536 bytes
	* 
	* // client generate C2, or server valid C2
	* temp-key = HMACsha256(s1-digest, FPKey, 62)
	* c2-digest-data = HMACsha256(c2-random-data, temp-key, 32)
	*/
	virtual int c2_create(c1s1* s1);
	
	/**
	* create s2.
	* random fill c2s2 1536 bytes
	* 
	* // server generate S2, or client valid S2
	* temp-key = HMACsha256(c1-digest, FMSKey, 68)
	* s2-digest-data = HMACsha256(s2-random-data, temp-key, 32)
	*/
	virtual int s2_create(c1s1* c1);
};

c2s2::c2s2()
{
	for (int i = 0; i < 1504; i++) {
		*(random + i) = rand();
	}
	for (int i = 0; i < 32; i++) {
		*(digest + i) = rand();
	}
}

c2s2::~c2s2()
{
}

void c2s2::dump(char* _c2s2)
{
	memcpy(_c2s2, random, 1504);
	memcpy(_c2s2 + 1504, digest, 32);
}

int c2s2::c2_create(c1s1* s1)
{
	int ret = ERROR_SUCCESS;
	
	char temp_key[OpensslHashSize];
	if ((ret = openssl_HMACsha256(s1->get_digest(), 32, BrsGenuineFPKey, 62, temp_key)) != ERROR_SUCCESS) {
		Log("create c2 temp key failed. ret=%d", ret);
		return ret;
	}
	Log("generate c2 temp key success.");
	
	char _digest[OpensslHashSize];
	if ((ret = openssl_HMACsha256(random, 1504, temp_key, 32, _digest)) != ERROR_SUCCESS) {
		Log("create c2 digest failed. ret=%d", ret);
		return ret;
	}
	Log("generate c2 digest success.");
	
	memcpy(digest, _digest, 32);
	
	return ret;
}

int c2s2::s2_create(c1s1* c1)
{
	int ret = ERROR_SUCCESS;
	
	char temp_key[OpensslHashSize];
	if ((ret = openssl_HMACsha256(c1->get_digest(), 32, BrsGenuineFMSKey, 68, temp_key)) != ERROR_SUCCESS) {
		Log("create s2 temp key failed. ret=%d", ret);
		return ret;
	}
	Log("generate s2 temp key success.");
	
	char _digest[OpensslHashSize];
	if ((ret = openssl_HMACsha256(random, 1504, temp_key, 32, _digest)) != ERROR_SUCCESS) {
		Log("create s2 digest failed. ret=%d", ret);
		return ret;
	}
	Log("generate s2 digest success.");
	
	memcpy(digest, _digest, 32);
	
	return ret;
}

c1s1::c1s1()
{
	schema = brs_schema_invalid;
}
c1s1::~c1s1()
{
	destroy_blocks();
}

char* c1s1::get_digest()
{
	assert(schema != brs_schema_invalid);
	
	if (schema == brs_schema0) {
		return block1.digest.digest;
	} else {
		return block0.digest.digest;
	}
}

void c1s1::dump(char* _c1s1)
{
	assert(schema != brs_schema_invalid);
	
	if (schema == brs_schema0) {
		brs_schema0_copy_to(_c1s1, true, time, version, &block0.key, &block1.digest);
	} else {
		brs_schema1_copy_to(_c1s1, true, time, version, &block0.digest, &block1.key);
	}
}

int c1s1::c1_create(brs_schema_type _schema)
{
	int ret = ERROR_SUCCESS;
	
	if (_schema == brs_schema_invalid) {
		ret = ERROR_RTMP_CH_SCHEMA;
		Log("create c1 failed. invalid schema=%d, ret=%d", _schema, ret);
		return ret;
	}
	
	destroy_blocks();
	
	time = ::time(NULL);
	version = 0x02070080; // client c1 version
	
	if (_schema == brs_schema0) {
		brs_key_block_init(&block0.key);
		brs_digest_block_init(&block1.digest);
	} else {
		brs_digest_block_init(&block0.digest);
		brs_key_block_init(&block1.key);
	}
	
	schema = _schema;
	
	char* digest = NULL;
	
	if ((ret = calc_c1_digest(digest)) != ERROR_SUCCESS) {
		Log("sign c1 error, failed to calc digest. ret=%d", ret);
		return ret;
	}
	
	assert(digest != NULL);
	BrsAutoFree(char, digest, true);
	
	if (schema == brs_schema0) {
		memcpy(block1.digest.digest, digest, 32);
	} else {
		memcpy(block0.digest.digest, digest, 32);
	}
	
	return ret;
}

int c1s1::c1_parse(char* _c1s1, brs_schema_type _schema)
{
	int ret = ERROR_SUCCESS;
	
	if (_schema == brs_schema_invalid) {
		ret = ERROR_RTMP_CH_SCHEMA;
		Log("parse c1 failed. invalid schema=%d, ret=%d", _schema, ret);
		return ret;
	}
	
	destroy_blocks();
	
	time = *(int32_t*)_c1s1;
	version = *(int32_t*)(_c1s1 + 4); // client c1 version
	
	if (_schema == brs_schema0) {
		if ((ret = brs_key_block_parse(&block0.key, _c1s1 + 8)) != ERROR_SUCCESS) {
			Log("parse the c1 key failed. ret=%d", ret);
			return ret;
		}
		if ((ret = brs_digest_block_parse(&block1.digest, _c1s1 + 8 + 764)) != ERROR_SUCCESS) {
			Log("parse the c1 digest failed. ret=%d", ret);
			return ret;
		}
		Log("parse c1 key-digest success");
	} else if (_schema == brs_schema1) {
		if ((ret = brs_digest_block_parse(&block0.digest, _c1s1 + 8)) != ERROR_SUCCESS) {
			Log("parse the c1 key failed. ret=%d", ret);
			return ret;
		}
		if ((ret = brs_key_block_parse(&block1.key, _c1s1 + 8 + 764)) != ERROR_SUCCESS) {
			Log("parse the c1 digest failed. ret=%d", ret);
			return ret;
		}
		Log("parse c1 digest-key success");
	} else {
		ret = ERROR_RTMP_CH_SCHEMA;
		Log("parse c1 failed. invalid schema=%d, ret=%d", _schema, ret);
		return ret;
	}
	
	schema = _schema;
	
	return ret;
}

int c1s1::c1_validate_digest(bool& is_valid)
{
	int ret = ERROR_SUCCESS;
	
	char* c1_digest = NULL;
	
	if ((ret = calc_c1_digest(c1_digest)) != ERROR_SUCCESS) {
		Log("validate c1 error, failed to calc digest. ret=%d", ret);
		return ret;
	}
	
	assert(c1_digest != NULL);
	BrsAutoFree(char, c1_digest, true);
	
	if (schema == brs_schema0) {
		is_valid = brs_bytes_equals(block1.digest.digest, c1_digest, 32);
	} else {
		is_valid = brs_bytes_equals(block0.digest.digest, c1_digest, 32);
	}
	
	return ret;
}

int c1s1::s1_create(c1s1* c1)
{
	int ret = ERROR_SUCCESS;
	
	if (c1->schema == brs_schema_invalid) {
		ret = ERROR_RTMP_CH_SCHEMA;
		Log("create s1 failed. invalid schema=%d, ret=%d", c1->schema, ret);
		return ret;
	}
	
	destroy_blocks();
	schema = c1->schema;
	
	time = ::time(NULL);
	version = 0x01000504; // server s1 version
	
	if (schema == brs_schema0) {
		brs_key_block_init(&block0.key);
		brs_digest_block_init(&block1.digest);
	} else {
		brs_digest_block_init(&block0.digest);
		brs_key_block_init(&block1.key);
	}
	
	if (schema == brs_schema0) {
		if ((ret = openssl_generate_key(c1->block0.key.key, block0.key.key, 128)) != ERROR_SUCCESS) {
			Log("calc s1 key failed. ret=%d", ret);
			return ret;
		}
	} else {
		if ((ret = openssl_generate_key(c1->block1.key.key, block1.key.key, 128)) != ERROR_SUCCESS) {
			Log("calc s1 key failed. ret=%d", ret);
			return ret;
		}
	}
	Log("calc s1 key success.");
		
	char* s1_digest = NULL;
	if ((ret = calc_s1_digest(s1_digest))  != ERROR_SUCCESS) {
		Log("calc s1 digest failed. ret=%d", ret);
		return ret;
	}
	Log("calc s1 digest success.");
	
	assert(s1_digest != NULL);
	BrsAutoFree(char, s1_digest, true);
	
	if (schema == brs_schema0) {
		memcpy(block1.digest.digest, s1_digest, 32);
	} else {
		memcpy(block0.digest.digest, s1_digest, 32);
	}
	Log("copy s1 key success.");
	
	return ret;
}

int c1s1::calc_s1_digest(char*& digest)
{
	int ret = ERROR_SUCCESS;
	
	assert(schema == brs_schema0 || schema == brs_schema1);
	
	char* c1s1_joined_bytes = NULL;

	if (schema == brs_schema0) {
		c1s1_joined_bytes = brs_bytes_join_schema0(time, version, &block0.key, &block1.digest);
	} else {
		c1s1_joined_bytes = brs_bytes_join_schema1(time, version, &block0.digest, &block1.key);
	}
	
	assert(c1s1_joined_bytes != NULL);
	BrsAutoFree(char, c1s1_joined_bytes, true);
	
	digest = new char[OpensslHashSize];
	if ((ret = openssl_HMACsha256(c1s1_joined_bytes, 1536 - 32, BrsGenuineFMSKey, 36, digest)) != ERROR_SUCCESS) {
		Log("calc digest for s1 failed. ret=%d", ret);
		return ret;
	}
	Log("digest calculated for s1");
	
	return ret;
}

int c1s1::calc_c1_digest(char*& digest)
{
	int ret = ERROR_SUCCESS;
	
	assert(schema == brs_schema0 || schema == brs_schema1);
	
	char* c1s1_joined_bytes = NULL;

	if (schema == brs_schema0) {
		c1s1_joined_bytes = brs_bytes_join_schema0(time, version, &block0.key, &block1.digest);
	} else {
		c1s1_joined_bytes = brs_bytes_join_schema1(time, version, &block0.digest, &block1.key);
	}
	
	assert(c1s1_joined_bytes != NULL);
	BrsAutoFree(char, c1s1_joined_bytes, true);
	
	digest = new char[OpensslHashSize];
	if ((ret = openssl_HMACsha256(c1s1_joined_bytes, 1536 - 32, BrsGenuineFPKey, 30, digest)) != ERROR_SUCCESS) {
		Log("calc digest for c1 failed. ret=%d", ret);
		return ret;
	}
	Log("digest calculated for c1");
	
	return ret;
}

void c1s1::destroy_blocks()
{
	if (schema == brs_schema_invalid) {
		return;
	}
	
	if (schema == brs_schema0) {
		brs_key_block_free(&block0.key);
		brs_digest_block_free(&block1.digest);
	} else {
		brs_digest_block_free(&block0.digest);
		brs_key_block_free(&block1.key);
	}
}

  
  
BRSComplexHandShake::BRSComplexHandShake(){}

BRSComplexHandShake::~BRSComplexHandShake(){}


int BRSComplexHandShake::handshake(BRSReadWriter *srw, char* _c1)
{
	int ret = ERROR_SUCCESS;
	
	ssize_t nsize;
	
	static bool _random_initialized = false;
	if (!_random_initialized) {
		srand(0);
		_random_initialized = true;
		brs_info("srand initialized the random.");
	}
	
	// decode c1
	c1s1 c1;
	// try schema0.
	if ((ret = c1.c1_parse(_c1, brs_schema0)) != ERROR_SUCCESS) {
		brs_error("parse c1 schema%d error. ret=%d", brs_schema0, ret);
		return ret;
	}
	// try schema1
	bool is_valid = false;
	if ((ret = c1.c1_validate_digest(is_valid)) != ERROR_SUCCESS || !is_valid) {
		if ((ret = c1.c1_parse(_c1, brs_schema1)) != ERROR_SUCCESS) {
			brs_error("parse c1 schema%d error. ret=%d", brs_schema1, ret);
			return ret;
		}
		
		if ((ret = c1.c1_validate_digest(is_valid)) != ERROR_SUCCESS || !is_valid) {
			ret = ERROR_RTMP_TRY_SIMPLE_HS;
			brs_error("all schema valid failed, try simple handshake. ret=%d", ret);
			return ret;
		}
	}
	brs_info("decode c1 success.");
	
	// encode s1
	c1s1 s1;
	if ((ret = s1.s1_create(&c1)) != ERROR_SUCCESS) {
		brs_error("create s1 from c1 failed. ret=%d", ret);
		return ret;
	}
	brs_info("create s1 from c1 success.");
	
	c2s2 s2;
	if ((ret = s2.s2_create(&c1)) != ERROR_SUCCESS) {
		brs_error("create s2 from c1 failed. ret=%d", ret);
		return ret;
	}
	brs_info("create s2 from c1 success.");
	
	// sendout s0s1s2
	char* s0s1s2 = new char[3073];
      BrsAutoFree(char, s0s1s2, true);
	// plain text required.
	s0s1s2[0] = 0x03;
	s1.dump(s0s1s2 + 1);
	s2.dump(s0s1s2 + 1537);
    if ((ret = srw->writen(s0s1s2, 3073, &nsize)) != ERROR_SUCCESS) {
        brs_error("complex handshake send s0s1s2 failed. ret=%d", ret);
        return ret;
    }
    brs_info("complex handshake send s0s1s2 success.");
    
    // recv c2
    char* c2 = new char[1536];
    BrsAutoFree(char, c2, true);
    if ((ret = srw->readn(c2, 1536, &nsize)) != ERROR_SUCCESS) {
        brs_error("complex handshake read c2 failed. ret=%d", ret);
        return ret;
    }
    brs_info("complex handshake read c2 success.");
	
	return ret;
	
}


BRSSimpleHandShake::BRSSimpleHandShake(){}

BRSSimpleHandShake::~BRSSimpleHandShake(){}

int BRSSimpleHandShake::handshake(BRSReadWriter *srw, char* c1)
{
      
  return 0;
}

  
  
  
  
  
}
