#include "callcpp.h"

CallCPP::CallCPP(): m_age(10)
{

}

int CallCPP::GetAge() const
{
    cout<<"CallCPP::GetAge(). m_age = " <<m_age<<endl;
    return m_age;
}

int CallCPP::testInvoke()
{
    cout<<"CallCPP::testInvoke().m_age = "<< ++m_age<<endl;
    return 0;
}

int CallCPP::testSlot()
{
    cout<<"CallCPP::testSlot().m_age = "<< ++m_age<<endl;
    return 0;
}
