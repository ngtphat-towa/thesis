#!/bin/bash

# Define directories and files
directories=(
    "report"
    "report/chapters"
    "report/figures"
    "report/tables"
    "report/appendices"
    "report/preamble"
    "report/misc"
)

files=(
    "report/main.tex"
    "report/thesis.bib"
    "report/chapters/introduction.tex"
    "report/chapters/literature_review.tex"
    "report/chapters/methodology.tex"
    "report/chapters/system_design.tex"
    "report/chapters/implementation.tex"
    "report/chapters/evaluation.tex"
    "report/chapters/conclusion.tex"
    "report/chapters/future_work.tex"
    "report/appendices/appendixA.tex"
    "report/appendices/appendixB.tex"
    "report/preamble/packages.tex"
    "report/preamble/commands.tex"
    "report/misc/glossary.tex"
    "report/misc/acronyms.tex"
)

# Create directories
for dir in "${directories[@]}"; do
    mkdir -p $dir
done

# Create files with content
cat <<EOL > report/main.tex
\documentclass[12pt,a4paper]{report}

% Preamble
\input{preamble/packages}
\input{preamble/commands}

\begin{document}

% Title Page
\title{Your Thesis Title}
\author{Your Name}
\date{Month Year}
\maketitle

% Abstract
\begin{abstract}
    This is the abstract of the thesis.
\end{abstract}

% Acknowledgments
\chapter*{Acknowledgments}
\addcontentsline{toc}{chapter}{Acknowledgments}
Thank those who helped you here.

% Table of Contents
\tableofcontents
\listoffigures
\listoftables

% Chapters
\input{chapters/introduction}
\input{chapters/literature_review}
\input{chapters/methodology}
\input{chapters/system_design}
\input{chapters/implementation}
\input{chapters/evaluation}
\input{chapters/conclusion}
\input{chapters/future_work}

% Bibliography
\bibliographystyle{plain}
\bibliography{thesis}

% Appendices
\appendix
\input{appendices/appendixA}
\input{appendices/appendixB}

\end{document}
EOL

cat <<EOL > report/thesis.bib
@book{author2020,
    author    = {Author, A.},
    title     = {Title of the Book},
    publisher = {Publisher},
    year      = {2020},
    address   = {City},
}

@article{smith2021,
    author  = {Smith, John},
    title   = {Title of the Article},
    journal = {Journal Name},
    year    = {2021},
    volume  = {10},
    number  = {2},
    pages   = {123-456},
}
EOL

cat <<EOL > report/chapters/introduction.tex
\chapter{Introduction}
\label{chap:introduction}

\section{Background}
This section provides background information on the topic.

\section{Problem Statement}
This section describes the problem addressed by the thesis.

\section{Objectives}
These are the objectives of the thesis.

\section{Thesis Structure}
This section describes the structure of the thesis.
EOL

cat <<EOL > report/chapters/literature_review.tex
\chapter{Literature Review}
\label{chap:literature_review}

\section{Related Work}
This section reviews related work in the field.

\section{Current Solutions}
This section discusses current solutions to the problem.

\section{Gap Analysis}
This section identifies gaps in the existing research.
EOL

cat <<EOL > report/chapters/methodology.tex
\chapter{Methodology}
\label{chap:methodology}

\section{Research Design}
This section describes the research design.

\section{Data Collection}
This section explains the data collection methods.

\section{Data Analysis}
This section details the data analysis procedures.
EOL

cat <<EOL > report/chapters/system_design.tex
\chapter{System Design}
\label{chap:system_design}

\section{Architecture}
This section describes the system architecture.

\section{Components}
This section details the components of the system.

\section{Design Decisions}
This section explains the design decisions made.
EOL

cat <<EOL > report/chapters/implementation.tex
\chapter{Implementation}
\label{chap:implementation}

\section{Development Process}
This section describes the development process.

\section{Technologies Used}
This section lists the technologies used in the implementation.

\section{Challenges}
This section discusses the challenges faced during implementation.
EOL

cat <<EOL > report/chapters/evaluation.tex
\chapter{Evaluation}
\label{chap:evaluation}

\section{Evaluation Criteria}
This section lists the criteria used for evaluation.

\section{Results}
This section presents the evaluation results.

\section{Discussion}
This section discusses the implications of the results.
EOL

cat <<EOL > report/chapters/conclusion.tex
\chapter{Conclusion}
\label{chap:conclusion}

\section{Summary}
This section provides a summary of the thesis.

\section{Contributions}
This section highlights the contributions of the thesis.

\section{Limitations}
This section discusses the limitations of the work.

\section{Future Work}
This section outlines directions for future research.
EOL

cat <<EOL > report/chapters/future_work.tex
\chapter{Future Work}
\label{chap:future_work}

This section outlines directions for future research.
EOL

cat <<EOL > report/appendices/appendixA.tex
\chapter{Appendix A}
\label{appendix:A}

This is the content of Appendix A.
EOL

cat <<EOL > report/appendices/appendixB.tex
\chapter{Appendix B}
\label{appendix:B}

This is the content of Appendix B.
EOL

cat <<EOL > report/preamble/packages.tex
% Packages
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{booktabs}
\usepackage{siunitx}
\usepackage{geometry}
\usepackage{setspace}
\usepackage{fancyhdr}

% Geometry settings
\geometry{a4paper, margin=1in}

% Set line spacing
\onehalfspacing

% Header and footer
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\leftmark}
\fancyfoot[C]{\thepage}
EOL

cat <<EOL > report/preamble/commands.tex
% Custom Commands
\newcommand{\thesistitle}{Your Thesis Title}
\newcommand{\authorname}{Your Name}
\newcommand{\submissiondate}{Month Year}

% Example of a custom command
\newcommand{\vect}[1]{\mathbf{#1}}
EOL

cat <<EOL > report/misc/glossary.tex
% Glossary
\newglossaryentry{example}{
    name=example,
    description={An example entry}
}
EOL

cat <<EOL > report/misc/acronyms.tex
% Acronyms
\newacronym{abc}{ABC}{Example Acronym}
EOL

# Make glossary and acronyms files LaTeX compatible
echo "\usepackage[acronym]{glossaries}" >> report/preamble/packages.tex
echo "\makeglossaries" >> report/main.tex
echo "\printglossary[type=\acronymtype]" >> report/main.tex

echo "Thesis structure has been created."
