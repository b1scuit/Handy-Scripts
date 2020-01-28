unsigned long fileLen;

// 
//  File managment
//
void readFile(char *name, char *binbuffer)
{
    FILE *file;

    //Open file
    file = fopen(name, "rb");
    if (!file)
    {
        fprintf(stderr, "Unable to open file %s", name);
        return;
    }

    //Get file length
    fseek(file, 0, SEEK_END);
    fileLen=ftell(file);
    fseek(file, 0, SEEK_SET);

    //Allocate memory
    binbuffer=(char *)malloc(fileLen+1);
    if (!binbuffer)
    {
        fprintf(stderr, "Memory error!");
        fclose(file);
        return;
    }

    //Read file contents into buffer
    fread(binbuffer, fileLen, 1, file);
    fclose(file);

    //Do what ever with buffer
    free(binbuffer);
}

void dumpBuffer(char *buffer, int bufferSize)
{
    for (int c=0;c<bufferSize;c++)
    {
        printf("%.2X ", (int)buffer[c]);

        //put an extra space between every 4 bytes
        if (c % 4 == 3)
        {
            printf(" ");
        }

        // Display 16 bytes per line
        if (c % 16 == 15)
        {
            printf("\n");
        }
    }
    // Add an extra line feed for good measure
    printf("\n");

}
