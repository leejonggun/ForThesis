//Wrtten by Joseph
/*
   This script is for connect() fault
   run etimedout_client.sh
   */
Import("posix.socket");

void test() {
//	destination
	String srcIP = "192.168.122.179";
	System.p(srcIP);
	int srcPort = 10001;
	int srcFamily = AF_INET;
	int srcType = SOCK_STREAM;
	int srcOPT = 0;

	int dstPort = 10002;
	int dstFamily = AF_INET;
	int dstType = SOCK_STREAM;
	int dstOPT = 0;

	SockAddr remoteInfo = new SockAddr();

//	socket socket(System.socket())
	int sockfd = System.socket(srcFamily, srcType, srcOPT);
	System.p(sockfd);

//	socket bind(System.bind())
	int ret = System.bind(sockfd, srcIP, srcPort, srcFamily);

//	socket listen(System.listen())
	ret = System.listen(sockfd, SOMAXCONN);

	while (true) {
		System.p("Preparing to accept...");
		ret = System.accept(sockfd, remoteInfo);

//		ret = System.recv(sockfd, msgfrom, 0);
		ret = System.read(sockfd, msgfrom);
		System.p(ret);
	}
	System.close(sockfd);
}

test();
