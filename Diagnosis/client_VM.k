//Wrtten by Joseph
/*
   This script is for connect() fault
   run etimedout_client.sh
   */
import("posix.socket");
import("posix.process");
import("cstyle");

void test() {
//	destination
	String dstIP = "192.168.59.40";
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
	while (true) {
		if(i == 10) {
			System.close(sockfd);
			sockfd = System.socket(dstFamily, dstType, dstOPT);
			ret = System.connect(sockfd, dstIP, dstPort, dstFamily);
			i = 0;
		}
		ret = System.write(sockfd, msg);
		System.p(ret);
		System.p("Sent a message to the server");
		System.sleep(1);
		i = i + 1;
	}
	System.close(sockfd);
}

test();
