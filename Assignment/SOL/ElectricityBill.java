import java.util.Scanner;
class ElectricityBill
{
    String n;
    int units;
    double bill;

    void accept()
    {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter the name of the customer");
        n = in.nextLine();
        System.out.println("Enter the number of units consumed");
        units = in.nextInt();
    }

    void calculate()
    {
        if(units<=100)
            bill = 1.2*units;
        else if(units>100 && units<=300) //next 200 units
            bill = 1.2*100 + (units-100)*2;
        else if(units>300)//above 300 units
        {
            bill = 1.2*100 + 2*200 + (units-300)*3;

        }
    }

    void print()
    {
        System.out.println("Name of the customer : " + n);
        System.out.println("Number of units consumed : " + units);
        System.out.println("Bill Amount: " + bill);
    }

    public static void main(String args[])
    {
        ElectricityBill obj = new ElectricityBill();
        obj.accept();
        obj.calculate();
        obj.print();
    }
}