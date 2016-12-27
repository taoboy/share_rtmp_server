#pragma once 

#include <BRSCommon.h>
#include <BRSEpoll.h>
#include <BRSSocket.h>
#include <BRSStream.h>
#include <BRSClientWorker.h>
#include <BRSPublicEntity.h>
#include <BRSCoroutine.h>
#include <BRSDataSource.h>
namespace BRS 
{
  typedef std::multimap<int ,BRSConsumer*> ConsumersOnPublisher;
  typedef std::multimap<int ,BRSConsumer*>::iterator PublisherItr;
  typedef std::pair<PublisherItr,PublisherItr> PubPair;
  class BRSServer:public BRSCoroutine
  {
    
  private:
    BRSSocket 			server_socket;
    BCCMItor 			bccmitor;
    BRSWorker  			*clientWorker;
    BRSClientContextMaps  	*brsClientContextMaps;
    ConsumersOnPublisher     	*consumersOnPublisher;
    PublisherItr               	pItr; 
    BRSEpoll		     	*server_epoll;
  public:
    
    BRSServer();
    int initServer(int mport);
    
    void start();
    
    void pushConsumer(int publisherFd,BRSConsumer * consumer);
    
    BRSConsumer* popConsumer(int publisherFd,int clientFd);
    
    int delConsumer(int clientFd);
    
    int closeClient(int fd);
  };
  
}