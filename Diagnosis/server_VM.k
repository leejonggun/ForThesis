//Wrtten by Joseph
/*
   This script is for connect() fault
   run etimedout_client.sh
   */
Import("posix.socket");
Import("cstyle");

void test() {
//	destination
	String srcIP = "192.168.2.102";
	System.p(srcIP);
	int srcPort = 10001;
	int srcFamily = AF_INET;
	int srcType = SOCK_STREAM;
	int srcOPT = 0;

	SockAddr remoteInfo = new SockAddr();

//	socket socket(System.socket())
	int sockfd = System.socket(srcFamily, srcType, srcOPT);
	System.p(sockfd);

//	socket bind(System.bind())
	int ret = System.bind(sockfd, srcIP, srcPort, srcFamily);

//	socket listen(System.listen())
	ret = System.listen(sockfd, SOMAXCONN);

	int acceptfd = 0;
	while (true) {
		System.p("Preparing to accept...");
		acceptfd = System.accept(sockfd, remoteInfo);

		ret = System.read(acceptfd);
		System.p(ret);
	}
	System.close(sockfd);
}

test();
