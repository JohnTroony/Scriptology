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
  string word;
  string output,output1,output2,output3,output4,output5,output6,output7;
  string output8,output9,outputa,outputb,outputc,outputd,outpute,outputf;
  string Shellcode;
  string clean;

 // Shellcode = "\xd9\xeb\x9b\xd9\x74\x24\xf4\x31\xd2\xb2\x77\x31\xc9\x64\x8b";
  
  cout<<"Enter Shellcode: ";
  cin>>Shellcode;
  clean = replace(Shellcode, "z","\\");
  output = replace(clean, "p", "x");
  output1 = replace(output, "g","0");
  output2 = replace(output1, "h","1");
  output3 = replace(output2, "i","2");
  output4 = replace(output3, "j","3");
  output5 = replace(output4, "k","4");
  output6 = replace(output5, "l","5");
  output7 = replace(output6, "m","6");
  output8 = replace(output7, "n","7");
  output9 = replace(output8, "o","8");
  outputa = replace(output9, "w","9");
  outputb = replace(outputa, "q","a");
  outputc = replace(outputb, "r","b");
  outputd = replace(outputc, "s","c");
  outpute = replace(outputd, "t","d");
  outputf = replace(outpute, "v","e");




  cout<<"Decoded Shellcode"<<endl;
 
  cout<<outputf<<endl;
  return 0;
}


