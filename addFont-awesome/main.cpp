#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    //添加字体文件
    int fontId = QFontDatabase::addApplicationFont(":/Font/fontawesome-webfont.ttf");//路径一定要写对
    QStringList fontFamilies = QFontDatabase::applicationFontFamilies(fontId);
    qDebug() << "fontFamilies.size() " << fontFamilies.size();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
