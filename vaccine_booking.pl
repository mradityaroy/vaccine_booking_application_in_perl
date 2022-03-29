#!/usr/bin/perl
%login_detail=(1234=>1234);
my %all_data;sub register{
	
	my %data;
	
	print "Enter Your ID No.: ";   
	$user_id=<STDIN>;
	chomp $user_id;
	
	print "Enter password: ";
	$password=<STDIN>;
	
	$login_detail{$user_id}=$password;

	print "Enter First Name: ";
	$user_first=<STDIN>;
	chomp $user_first;
	$data{'first_name'}=$user_first;
	
	print "Enter Last Name: ";
	$user_last=<STDIN>;
	chomp $user_last;
	$data{'last_name'}=$user_last;
	
	print "Enter Mobile No.: ";
	$user_mob=<STDIN>;
	chomp $user_mob;
	$data{'mob'}=$user_mob;
	
	print "Enter Date of Birth: ";
	$user_dob=<STDIN>;
	chomp $user_dob;
	$data{'dob'}=$user_dob;
	
	print "Enter Country: ";
	$user_country=<STDIN>;
	chomp $user_country;
	$data{'country'}=$user_country;
	
	print "Enter Place: ";
	$user_place=<STDIN>;
	chomp $user_place;
	$data{'place'}=$user_place;
	
	print "Enter Age: ";
	$user_age=<STDIN>;
	chomp $user_place;
	$data{'age'}=$user_age;
	
	print "Enter Dosage: ";
	$user_dosage=<STDIN>;
	chomp $user_dosage;
	$data{'dosage'}=$user_dosage;
	
	print "$data{'first_name'}\n";
	print "Vaccine Booked Successfully for Dosage $user_dosage \n";
	$all_data{$user_id}=\%data;
}       sub login{
	print "Enter Your ID No.: ";
	$user_id=<STDIN>;
	chomp $user_id;
	print "Enter password: ";
	$password=<STDIN>;
	chomp $password;
	
        if(exists($login_detail{$user_id}))
        {
            if($login_detail{$user_id}==$password)
            {
                print "---------WELCOME---------\n";
                print "press 1 for View Booking\n";
                print "press 2 for logout\n";
         
                while(1)
                {
                    $action=<STDIN>;
                    if($action==1)
                    {
                        foreach $vals ($all_data{$user_id})
                        {
			    print "$vals :$all_data{$user_id}{$vals}";
			}
                    }elsif($action==2){
                       action_perform();
                    }else{
                        print "Invaild input";
                        login();
                    }
                }
            }else
            {
                print "Invaild Credentials!\n";
            }
        }else
        {
        	print "We search everywhere in our system but unfortunately username not found please register with us first\n";
        	action_perform();
        }

}

sub action_perform{   
    %choice = (1=>'press 1 for login',2=>'press 2 for register: ');
    print "You have already registerd with us? \n";
    print "Then press 1 \n If you are new user then register with us by clicking 2\n";
    print "=========================== \n";
    foreach $word (%choice)
    {
        
        print "$choice{$word}\n";
    }
    $choice_input=<STDIN>;
    chomp $choice_input;
    if( $choice_input  ==  1 )
    {
        login();
             
   }elsif( $choice_input ==  2 )
   {
	register();
	login();
   }
 }
action_perform();

