#include "QtGUI.h"
#include <QApplication>
#include <QFileDialog>
#include <QMessageBox>
#include <QVBoxLayout>

// Constructor
QtGUI::QtGUI(QWidget *parent) 
    : QMainWindow(parent) {
    setupUI();
    connectSignals();
}

// Destructor
QtGUI::~QtGUI() {
    // Cleanup if required (automatic for Qt objects with a parent)
}

// UI Setup
void QtGUI::setupUI() {
    // Main widget and layout
    QWidget *centralWidget = new QWidget(this);
    QVBoxLayout *mainLayout = new QVBoxLayout(centralWidget);

    // Input file section
    inputFileLabel = new QLabel("Input File:", this);
    inputFilePath = new QLineEdit(this);
    browseButton = new QPushButton("Browse", this);

    QHBoxLayout *fileLayout = new QHBoxLayout();
    fileLayout->addWidget(inputFilePath);
    fileLayout->addWidget(browseButton);

    // Action buttons
    generateButton = new QPushButton("Generate Hooks", this);
    clearButton = new QPushButton("Clear", this);

    QHBoxLayout *buttonLayout = new QHBoxLayout();
    buttonLayout->addWidget(generateButton);
    buttonLayout->addWidget(clearButton);

    // Output display
    outputDisplay = new QTextEdit(this);
    outputDisplay->setReadOnly(true);

    // Add widgets to main layout
    mainLayout->addWidget(inputFileLabel);
    mainLayout->addLayout(fileLayout);
    mainLayout->addLayout(buttonLayout);
    mainLayout->addWidget(outputDisplay);

    setCentralWidget(centralWidget);
    setWindowTitle("Ghidra Frida Hook Generator");
    resize(800, 600);
}

// Connect Signals to Slots
void QtGUI::connectSignals() {
    connect(browseButton, &QPushButton::clicked, this, &QtGUI::browseFile);
    connect(generateButton, &QPushButton::clicked, this, &QtGUI::generateHooks);
    connect(clearButton, &QPushButton::clicked, this, &QtGUI::clearFields);
}

// Slot: Browse File
void QtGUI::browseFile() {
    QString fileName = QFileDialog::getOpenFileName(this, "Select Input File", "", "All Files (*.*);;JSON Files (*.json);;Text Files (*.txt)");
    if (!fileName.isEmpty()) {
        inputFilePath->setText(fileName);
    }
}

// Slot: Generate Hooks
void QtGUI::generateHooks() {
    QString filePath = inputFilePath->text();
    if (filePath.isEmpty()) {
        QMessageBox::warning(this, "Warning", "Please select an input file before generating hooks.");
        return;
    }

    outputDisplay->append("Generating hooks for file: " + filePath);

    try {
        // Placeholder for hook generation logic
        outputDisplay->append("Hooks successfully generated!");
    } catch (const std::exception &e) {
        QMessageBox::critical(this, "Error", QString("An error occurred during generation:\n%1").arg(e.what()));
    }
}

// Slot: Clear Fields
void QtGUI::clearFields() {
    inputFilePath->clear();
    outputDisplay->clear();
}
