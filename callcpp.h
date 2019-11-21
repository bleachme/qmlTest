#ifndef CALLCPP_H
#define CALLCPP_H

#include <QObject>

#include <iostream>
using namespace std;

class CallCPP: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int age READ GetAge)
public:
    CallCPP();

    int GetAge() const;
    Q_INVOKABLE int testInvoke();

public slots:
    int testSlot();


private:
    int m_age;
};

#endif // CALLCPP_H
