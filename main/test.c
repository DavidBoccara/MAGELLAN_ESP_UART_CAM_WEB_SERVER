#include "string.h"
#include "stdio.h"
#include "stdlib.h"
int main(int argc, char const *argv[])
{
	

	char resp[1] ;
  	scanf("%s", &resp); // On demande d'entrer l'âge avec scanf
	char * http_index_html =  (char *) malloc( 97 ) ;
	char buff = "this is a test string";
	char subbuff[5];

	strcpy(http_index_html, "<!DOCTYPE html><html><head><title>dada</title></head><body><h1>your uart is :");
	memcpy( subbuff, &buff, 4 );
	subbuff[4] = '\0';
    strcat(http_index_html, subbuff);
    strcat(http_index_html, "</h1></body></html>");
    printf("value received on queue: %s \n",http_index_html);
    //printf("%s\n",resp );
	return 0;
}