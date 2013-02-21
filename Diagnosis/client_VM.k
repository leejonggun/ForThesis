//Wrtten by Joseph
/*
   This script is for connect() fault
   run etimedout_client.sh
   */
Import("posix.socket");
Import("cstyle");

void test() {
//	destination
	String dstIP = "192.168.59.76";
	System.p(dstIP);
	int dstPort = 10001;
	int dstFamily = AF_INET;
	int dstType = SOCK_STREAM;
	int dstOPT = 0;

	int sockfd = System.socket(dstFamily, dstType, dstOPT);

	int ret = System.connect(sockfd, dstIP, dstPort, dstFamily);
	String msg = "Hello world!\n";
	System.p(msg);
	int i = 0;
	while (i < 10000000) {
		if (i == 9999999) {
//	rebind System.sendto() function
//	It's possible to use write, read function.
			ret = System.write(sockfd, msg);
//			ret = System.send(sockfd, msg, 0);
			System.p(ret);
			System.p("Sent a message to the server");
			i = 0;
		}
		i = i + 1;
	}
	System.close(sockfd);
}

test();
