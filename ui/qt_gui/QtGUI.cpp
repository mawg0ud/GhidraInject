#include "QtGUI.h"
#include <QPushButton>
#include <QLineEdit>
#include <QVBoxLayout>
#include <QMessageBox>
#include <QApplication>

QtGUI::QtGUI(QWidget *parent) : QWidget(parent) {
    // Initialize GUI components
    functionInput = new QLineEdit(this);
    QPushButton *generateButton = new QPushButton("Generate Hook", this);
    
    QVBoxLayout *layout = new QVBoxLayout();
    layout->addWidget(functionInput);
    layout->addWidget(generateButton);

    connect(generateButton, &QPushButton::clicked, this, &QtGUI::onGenerateButtonClick);

    setLayout(layout);
    setWindowTitle("Ghidra Frida Hook Generator");
}

void QtGUI::onGenerateButtonClick() {
    QString functionName = functionInput->text();
    if (functionName.isEmpty()) {
        QMessageBox::warning(this, "Input Error", "Function name cannot be empty.");
        return;
    }
    // Call HookGenerator or pass the function name for further processing
    emit generateHook(functionName.toStdString());
}
