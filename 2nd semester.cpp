#include<iostream>
#include <fstream>
using namespace std;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////HARDWARE INVENTORY AND MANAGEMENT SYSTEM//////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Hardware_device
{
private:                           // access modifiers
    string name;                   // to keep our data private
    string brand;
    float price;
    int id;

public:
	   static int count;
    void setName(string n);        // getters and setters
    void setBrand(string b);
    void setPrice(float p);
    void setId(int i);

    string getName();
    string getBrand();
    float getPrice();
    int getId();

    virtual void Inform()
    {
        cout << "I am Hardware device" << endl;
    }

     friend void display( Hardware_device);
    friend void display(string n,string b,float p,int i);

    Hardware_device()              // default constructor
    {
       // cout << "I am a device." << endl;
        count++;
    }


    Hardware_device(string n, string b, float p, int i) // parameterized constructor
    {
        name = n;
        brand = b;
        price = p;
        id = i;
         count++;
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////Copy constructor/////////////////////////////////////////////////////////////////////
    //Hardware_device(const Hardware_device &d) // copy constructor////////////////////////////////////////////////////////////////
    
    //{
     //   name = d.name;
     //   brand = d.brand;
      //  price = d.price;
       // id = d.id;
    //}
    
void operator++()//binary operator overload 
    {
        cout << "Operator Overloaded";
        count++;
}
    
};

void display( Hardware_device h3) // friend function definition
{
    cout << "Device name is: " << h3.name << endl;
    cout << "My brand name is: " << h3.brand << endl;
    cout << "My price is: " << h3.price << endl;
    cout << "My id is: " << h3.id<< endl;
}
void display(string n, string b, float p, int i)
{
    cout << n << endl;
    cout << b << endl;
    cout << p << endl;
    cout << i << endl;
}
class Specification
{
private:
    string color;
    int warranty;
};

class Hardware_device1
{
private:
    Specification spec;   // Composition
};
class User
{
};

class Hardware_device2
{
private:
    User *owner;   // Aggregation
};

////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////// Inheritance /////////////////////////////////////////////////////
////////////////////////////////////multilevel inheritence///////////////////////////////////////////////
class input_device : public Hardware_device
{
private:
    string inputtype;

public:
    void setInputDevice(string in);
    string getInputDevice();

    void Inform()
    {
        cout << "I am 1st type of Hardware device" << endl;
    }
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////Multilevel inheritence/////////////////////////////////////////////////////
class Mouse:public input_device
{
	private:
		string character;
	public:
		Mouse()
		{
			cout<<"enter which type of a mouse u have :"<<endl;
			cin>>character;
			if(character=="Light"||character=="light")
			{
				cout<<"I am a digital mouse."<<endl;
			}
			else{
			
			 cout<<"I am simple mouse."<<endl;
		}
}
};
class keyboard:public input_device
{
	private:
		string character;
	public:

		keyboard()
		{
			cout<<"enter which type of a keyboard u have :"<<endl;
			cin>>character;
			if(character=="Light"||character=="light")
			{
				cout<<"I am a digital keybaord."<<endl;
			}
			else{
			
			 cout<<"I am simple keyboard."<<endl;
		}
}
};
class output_device : public Hardware_device
{
private:
    string outputtype;

public:
    void setOutputdevice(string o);
    string getOutputdevice();

    void Inform()
    {
        cout << "I am 2nd type of Hardware device" << endl;
    }
    
};
  class screen:public output_device {
  private:
  	string  screentype;
  	public:
  		screen()
  		{
  			 cout << "Enter which type of screen you have: " << endl;
        cin >> screentype;

        if(screentype=="LED" || screentype=="led")
        {
            cout << "I am an LED screen." << endl;
        }
        else if(screentype=="LCD" || screentype=="lcd")
        {
            cout << "I am an LCD screen." << endl;
        }
        else if(screentype=="OLED" || screentype=="oled")
        {
            cout << "I am an OLED screen." << endl;
        }
        else
        {
            cout << "I am a simple screen." << endl;
        }
		  }
  };
  class projector:public  output_device 
  {
  	private:
  		string p;
  	public:
  		projector()
  		{
  			cout<<"enter your kind: "<<endl;
  			cin>>p;
  			if(p=="digital"||p=="Digital")
  			{
  				cout<<"I am digital device."<<endl;
			  }
			  else 
			  {
			  	cout<<"I am simple one "<<endl;
			  }
		  }
  };

class Network_device : public Hardware_device
{
private:
    string networkdevice;

public:
    void setNetworkdevice(string N);
    string getNetworkdevice();
    void Inform()
{
    cout<<"I am 3rd type of  Hardware device "<<endl;
}
};
class router:public  Network_device
{
	private:
		string rot;
		public:
			router()
			{
				cout<<"enter the router model:"<<endl;
				cin>>rot;
				if(rot=="New"||rot=="new")
				{
					cout<<"I am the latest version."<<endl;
				}
				else
				{
					cout<<"I am the old version"<<endl;
				}
			}
			~router(){
				
      	cout<<"THIS IS THE END OF THE PROJECT"<<endl;
	  
			}
};
  class switch1:public Network_device
  {
  	private:
  		string swi;
  		public:
  			switch1()
  			{
			  
  			cout<<"Enter the switch version"<<endl;
  			cin>>swi;
  			if(swi=="Old"||swi=="old")
  			{
  				cout<<"I am the oldest version"<<endl;
			  }
			  else 
			  {
			  	cout<<"I am the new one and latest version."<<endl;
			  }
		}
  };
  class modem:public Network_device
  {
  		private:
  		double le;
  		public:
  			modem(){
  				cout<<"Enter the signal length: "<<endl;
  				cin>>le;
  				if(le==100)
  				{
  					cout<<"My range is:"<<endl;
				  }
				  else 
				  {
				  	cout<<"My range is ver large."<<endl;
				  }
			  }
		};
class Storage_devices : public Hardware_device
{
private:
    string storagedevice;

public:
    void setStoragedevice(string s);
    string getStoragedevice();
    void Inform()
{
    cout<<"I am 4th type of Hardware device "<<endl;
}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////// Setters and Getters Definitions ///////////////////////////////////////////////

void Hardware_device::setName(string n)
{
    name = n;
}

void Hardware_device::setBrand(string b)
{
    brand = b;
}

void Hardware_device::setPrice(float p)
{
    price = p;
}

void Hardware_device::setId(int i)
{
    id = i;
}

string Hardware_device::getName()
{
    return name;
}

string Hardware_device::getBrand()
{
    return brand;
}

float Hardware_device::getPrice()
{
    return price;
}

int Hardware_device::getId()
{
    return id;
}

void input_device::setInputDevice(string in)
{
    inputtype = in;
}

string input_device::getInputDevice()
{
    return inputtype;
}

void output_device::setOutputdevice(string o)
{
    outputtype = o;
}

string output_device::getOutputdevice()
{
    return outputtype;
}

void Storage_devices::setStoragedevice(string s)
{
    storagedevice = s;
}

string Storage_devices::getStoragedevice()
{
    return storagedevice;
}

void Network_device::setNetworkdevice(string N)
{
    networkdevice = N;
}

string Network_device::getNetworkdevice()
{
    return networkdevice;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Main Function /////////////////////////////////////////////////////
 int Hardware_device::count = 0;
int main()
{
    string b, n, in,category,ot,nt,s;
    float p;
    int i;

    Hardware_device h;
    Hardware_device h1(n, b, p, i);

    cout << "Enter Your device name: " << endl;
    cin >> n;

    cout << "Enter your brand name: " << endl;
    cin >> b;

    cout << "Enter your price: " << endl;
    cin >> p;

    cout << "Enter your id: " << endl;
    cin >> i;
    
    h1.setName(n);
    h1.setBrand(b);
    h1.setPrice(p);
    ++h;
    h1.setId(i);

    cout << h1.getName() << endl;
    cout << h1.getBrand() << endl;
    cout << h1.getPrice() << endl;
    cout << h1.getId() << endl;

    //Hardware_device h2 = h1;
    cout<<"Enter category: "<<endl;
    cin>>category;
    if(category=="Inputdevice"||category=="inputdevice")
    {
    	cout<<"enter your type: "  "(mouse//keyboard)"<<endl;
    	cin>>in;
	
    if(in=="mouse" || in=="Mouse")
{
    Mouse m;
    Hardware_device *ptr = &m;
    ptr->Inform();
}
else 
{
    keyboard k;
    Hardware_device *ptr = &k;
    ptr->Inform();
}
}
     if (category=="Outputdevice"||category=="outputdevice")
     {
     	cout<<"enter your type: "  "(screen//projector)"<<endl;
    	cin>>ot;
     	if(ot=="screen" || ot=="Screen")
{
    screen s2;              
    Hardware_device *ptr = &s2;
    ptr->Inform();
}
else 
{
    projector p;
    Hardware_device *ptr = &p;
    ptr->Inform();
}
	 }
    
    
		
            else if (category=="Networkdevice"||category=="networkdevice")
            {
                cout<<"enter the further kind of device"<<endl;
            	cout<<"Enter type: "        "(router//modem//switch)"<<endl;
            	cin>>nt;
            	cout<<"My work is to connect the computer or devices with each other."<<endl;
            if(nt=="Router" || nt=="router")
{
    router r;
    Hardware_device *ptr = &r;
    ptr->Inform();
}
else if(nt=="Switch" || nt=="switch")
{
    switch1 sw;
    Hardware_device *ptr = &sw;
    ptr->Inform();
}
else
{
    modem md;
    Hardware_device *ptr = &md;
    ptr->Inform();
}
	
			}
			else
			{
				if(s=="SSD"||s=="HD"||s=="CD"||s=="DVD")
				{
				   cout<<"My work is to store large data for permenetaly."<<endl;	
				}
			}
        
    
    cout << "Total Devices = " << Hardware_device::count<<endl;//static count
      display(h1);
    display(n,b,p,i);
   double *price=new double;
   cout<<"Enter the device price: "<<endl;
   cin>>*price;
   cout<<"MY PRICE IS: "<<*price;
   delete price;
   ofstream fout;

fout.open("Hardware.txt", ios::app);
fout<<"----------------------------------------------------------"<<endl;
fout << "Device Name: " << n << endl;
fout << "Brand: " << b << endl;
fout << "Price: " << p << endl;
fout << "ID: " << i << endl;
fout.close();


fout<<"--------------------------------------------------------------"<<endl;
    return 0;
}

