#include <iostream>
#include <string>

using namespace std;


// Character Switching function..
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


// Shit Starts here
int main() {

  // Variables for holding changing shellcode 
  string output,output0,output1,output2,output3,output4,output5,output6,output7;
  string output8,output9,outputa,outputb,outputc,outputd,outpute,outputf,encoded;
  string clean;
  
  cout<<"Enter Shellcode: ";
  cin>>clean;
  
  // iterate on the shellcode and switch chars
  output = replace(clean, "\\","g");
  output0 = replace(output, "x", "h");
  output1 = replace(output0, "0","i");
  output2 = replace(output1, "1","j");
  output3 = replace(output2, "2","k");
  output4 = replace(output3, "3","l");
  output5 = replace(output4, "4","m");
  output6 = replace(output5, "5","o");
  output7 = replace(output6, "6","p");
  output8 = replace(output7, "7","q");
  output9 = replace(output8, "8","s");
  outputa = replace(output9, "9","u");
  outputb = replace(outputa, "a","w");
  outputc = replace(outputb, "b","y");
  outputd = replace(outputc, "c","z");
  outpute = replace(outputd, "d","_");
  outputf = replace(outpute, "e","+");
  encoded = replace(outputf, "f","=");

  
  cout<<"New Encoded Shellcode : "<<endl;
 
  cout<<encoded<<endl;
  return 0;
}


