//
// Data manipulation
//
void byteBreaker(unsigned int bite, u_int8_t *low, u_int8_t *high){
    *low = bite & 0xff;
    *high = (bite >> 8);
}

unsigned int reverseBits(unsigned int num) 
{ 
    unsigned int NO_OF_BITS = sizeof(num) * 8; 
    unsigned int reverse_num = 0; 
    int i; 
    for (i = 0; i < NO_OF_BITS; i++) 
    { 
        if((num & (1 << i))) 
            reverse_num |= 1 << ((NO_OF_BITS - 1) - i); 
    } 
    return reverse_num; 
} 

