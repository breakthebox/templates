% breakthebox.cls
% Break the Box GmbH latex template for documents.
% 2016-03-29 info@breakthebox.ch

% --- Class structure: identification part
% ---

% --- Class structure
% ---
% This class extends the article class.
% Read all the document class options; pass them 
% to article unless the file <currentoption>.min 
% exists, then it is loaded.
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
	\PassOptionsToClass{\CurrentOption}{article}}}

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax

% --- Class structure: declaration of options part
% ---
\LoadClass{article}

% \renewcommand{\contentsname}{Inhaltsverzeichnis}

% --- Class structure: default language
% ---
\usepackage[utf8]{inputenc}


% --- Fonts
\usepackage[default]{lato}
\usepackage[T1]{fontenc}
\usepackage[english,german]{babel}

\renewcommand{\rmdefault}{lato} % default roman font: Lato
\renewcommand{\sfdefault}{lato} % default sans serif font: Lato
% \renewcommand{\ttdefault}{lato} % default monospace font: Lato

% --- Indentation & paragraph styles
% ---
\newcommand{\sectionbreak}{\clearpage}

\setlength{\parindent}{0em}
\setlength{\parskip}{0.8em}

\usepackage{titlesec}
\titlespacing{\section}{-2.2em}{*.5}{*0}
\titlespacing{\subsection}{-2.9em}{*.5}{*0}
\titlespacing{\subsubsection}{-3.2em}{*.5}{*0}


% --- Page layout
% ---
\RequirePackage[left=2.5cm,right=2.5cm,top=1.4cm,bottom=5cm]{geometry}
\usepackage{graphicx}
% \usepackage{lastpage}

\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
	\fancyhf{} % clear all six fields
	\renewcommand{\headrulewidth}{0pt}
	\fancyhead[C]{\bfseries \show@classification \vspace{2cm}}
}

\fancypagestyle{followingpage}{%
	\fancyhf{} % clear all six fields
	\fancyhead[C]{\bfseries \show@classification \vspace{1.3cm}}
	\fancyhead[L]{\includegraphics[width=3.5cm]{logo_landscape}}
	\fancyhead[R]{\show@project \\ \show@customer \\ \show@doctitle}

	\rfoot{\thepage \hspace{2pt} / \pageref{LastPage}}
	\lfoot{\show@version \hspace{1pt} / \show@versiondate \hspace{1pt} / \@author
	\hspace{2pt}\\ \tiny{\copyright Break the Box GmbH, \the\year.}}
}

% \headheight 2.8cm
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

% --- Title page
% ---
\usepackage{setspace}

\renewcommand{\maketitle}{\begingroup % Create the command for including the title page in the document
\pagestyle{firstpage}
\includegraphics[width=2.5cm]{logo_portrait}

\vspace*{\fill}

\vspace{5cm}
\begin{spacing}{2}
{\Huge \bfseries \show@project \par} % --- Project Name
\end{spacing}
\vspace{24pt}
\begin{spacing}{2}
{\Huge\bfseries \show@customer \par} % --- Customer Name
\end{spacing}
\begin{spacing}{1.5}
{\huge \show@doctitle \par} % --- Document Title
\end{spacing}

\vfill
\begin{tabular}{l l}
\hline
\\
\textbf{Datum} & \show@versiondate \\
\textbf{Version} & \show@version \\
\textbf{Autor/en} & \@author \\
\textbf{Status} & \show@status \\
\\
\hline
\tiny{\copyright Break the Box GmbH, \the\year}
\end{tabular}



\vfill
\clearpage
\endgroup}

% --- Definitions
% ---

% --- classification
\def\@classification{}
\newcommand{\setclassification}[1]{\def\@classification{#1}}
\newcommand{\show@classification}{\@classification}
\newcommand{\classification}[1]{#1}

% --- project
\def\@project{}
\newcommand{\setproject}[1]{\def\@project{#1}}
\newcommand{\show@project}{\@project}
\newcommand{\project}[1]{#1}

% --- customer
\def\@customer{}
\newcommand{\setcustomer}[1]{\def\@customer{#1}}
\newcommand{\show@customer}{\@customer}
\newcommand{\customer}[1]{#1}

% --- doctitle
\def\@doctitle{}
\newcommand{\setdoctitle}[1]{\def\@doctitle{#1}}
\newcommand{\show@doctitle}{\@doctitle}
\newcommand{\doctitle}[1]{#1}

% --- version
\def\@version{}
\newcommand{\setversion}[1]{\def\@version{#1}}
\newcommand{\show@version}{\@version}
\newcommand{\version}[1]{#1}

% --- versiondate
\def\@versiondate{}
\newcommand{\setversiondate}[1]{\def\@versiondate{#1}}
\newcommand{\show@versiondate}{\@versiondate}
\newcommand{\versiondate}[1]{#1}

% --- status
\def\@status{}
\newcommand{\setstatus}[1]{\def\@status{#1}}
\newcommand{\show@status}{\@status}
\newcommand{\status}[1]{#1}
