#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "callcpp.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<CallCPP>("CallCPP.module", 1, 0 , "QMLClass");

    QQmlApplicationEngine engine;
    //const QUrl url(QStringLiteral("qrc:/main.qml"));  Rectangle
    const QUrl url(QStringLiteral("qrc:/winndow.qml"));
    //const QUrl url(QStringLiteral("qrc:/next.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    //const QUrl urlNext(QStringLiteral("qrc:/next.qml"));
    //engine.load(urlNext);

    return app.exec();
}
