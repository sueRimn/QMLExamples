#include <QDebug>
#include <QSettings>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //注册全局属性
    qmlRegisterSingletonType(QUrl("qrc:/Global/GlobalAttributes.qml"),"Qt.an.qobjectSingleton",1,0,"GlobalVar");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
