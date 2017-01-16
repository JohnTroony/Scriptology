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
  clean = replace(Shellcode, "\\", "z");
  output = replace(clean, "x", "p");
  output1 = replace(output, "0","g");
  output2 = replace(output1, "1","h");
  output3 = replace(output2, "2","i");
  output4 = replace(output3, "3","j");
  output5 = replace(output4, "4","k");
  output6 = replace(output5, "5","l");
  output7 = replace(output6, "6","m");
  output8 = replace(output7, "7","n");
  output9 = replace(output8, "8","o");
  outputa = replace(output9, "9","w");
  outputb = replace(outputa, "a","q");
  outputc = replace(outputb, "b","r");
  outputd = replace(outputc, "c","s");
  outpute = replace(outputd, "d","t");
  outputf = replace(outpute, "e","v");


  cout<<"Encoded Shellcode"<<endl;
 
  cout<<outputf<<endl;
  return 0;
}


