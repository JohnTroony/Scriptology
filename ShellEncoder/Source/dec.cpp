#include <iostream>
#include <string>
using namespace std;
// Replace function..
string replace(string word, string target, string replacement){
    int len, loop=0;
    string nword="", let;
    len=word.length();
    len--;
    while(loop<=len){
        let=word.substr(loop, 1);
        if(let==target){
            nword=nword+replacement;
        }else{
            nword=nword+let;
        }
        loop++;
    }
    return nword;

}
//Main..
int main() {
  string output,output0,output1,output2,output3,output4,output5,output6,output7;
  string output8,output9,outputa,outputb,outputc,outputd,outpute,outputf,decoded;
  string clean;

 // Shellcode = "\xd9\xeb\x9b\xd9\x74\x24\xf4\x31\xd2\xb2\x77\x31\xc9\x64\x8b";
  
  cout<<"Enter Shellcode: ";
  cin>>clean;
  
  output  = replace(clean, "h","x");
  output0 = replace(output, "i","0");
  output1 = replace(output0, "j","1");
  output2 = replace(output1, "k","2");
  output3 = replace(output2, "l","3");
  output4 = replace(output3, "m","4");
  output5 = replace(output4, "o","5");
  output6 = replace(output5, "p","6");
  output7 = replace(output6, "q","7");
  output8 = replace(output7, "s","8");
  output9 = replace(output8, "u","9");
  outputa = replace(output9, "w","a");
  outputb = replace(outputa, "y","b");
  outputc = replace(outputb, "z","c");
  outputd = replace(outputc, "_","d");
  outpute = replace(outputd, "+","e");
  outputf = replace(outpute, "=","f");
  decoded = replace(outputf, "g","\\");


  cout<<"Decoded Shellcode : "<<endl;
 
  cout<<decoded<<endl;
  return 0;
}


