\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ui_progress}[2014/02/23 v.05]
\LoadClass[12pt,a4paper]{article}

\ProcessOptions
\RequirePackage{amsmath, amsthm, graphicx, fancybox, bbding, pdftexcmds, colortbl, multirow, geometry, hhline, lipsum, setspace, pgf, pgfpages, enumitem}

\onehalfspacing
\setlength{\footskip}{50pt}
\addtolength{\textheight}{6cm}
\addtolength{\headsep}{-2cm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pgfpagesdeclarelayout{boxed}
{
  \edef\pgfpageoptionborder{0pt}
}
{
  \pgfpagesphysicalpageoptions
  {%
    logical pages=1,%
  }
  \pgfpageslogicalpageoptions{1}
  {
    border code=\pgfsetlinewidth{1pt}\pgfstroke,%
    border shrink=\pgfpageoptionborder,%
    resized width=.95\pgfphysicalwidth,%
    resized height=.95\pgfphysicalheight,%
    center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}%
  }%
}

%\pgfpagesuselayout{boxed}
%مشخصات پایان‌نامه
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\grayrow{\rowcolor[gray]{.8}}
\def\graycell{\cellcolor[gray]{.8}}
\def\tallrow{\rule[-10pt]{0pt}{25pt}}
\def\mydef#1#2{
   	\expandafter\newcommand\csname #1\endcsname[1]
		{\expandafter\def\csname @#1\endcsname{##1}}
	\expandafter\def\csname @#1\endcsname{}
	 \expandafter\newcommand\csname #2\endcsname
		{\expandafter \csname#1\endcsname}
 }

\mydef{reportno}{شماره‌گزارش}

%student
\mydef{department}{گروه}
\mydef{student}{دانشجو}
\mydef{stno}{شماره‌دانشجویی}
\mydef{field}{‌رشته‌تحصیلی}
\mydef{subfield}{گرایش}
\mydef{level}{مقطع}
\mydef{faculty}{دانشکده}
\mydef{maxyear}{سنوات}
\mydef{logo}{آرم}
\mydef{email}{ایمیل}
\mydef{telephone}{تلفن‌تماس}

%supervisor
\mydef{supervisor}{‌استادراهنما}
\mydef{secsupervisor}{استا‌دراهنمای‌دوم}
\mydef{suptitle}{عنوان‌استادراهنما}

%advisor
\mydef{advisor}{استادمشاور}
\mydef{secadvisor}{استادمشاوردوم}

%thesis properties
\mydef{farsititle}{عنوان‌فارسی}
\mydef{latintitile}{عنوان‌لاتین}
\mydef{proposaldate}{تاریخ‌تصویب}
\mydef{defencedate}{تاریخ‌دفاع}

%report dates
\mydef{reportstartdate}{تاریخ‌شروع}
\mydef{reportenddate}{تاریخ‌پایان}
\mydef{reportduration}{مدت}

%report items
\mydef{workprogress}{پیشرفت‌کار}
\mydef{problemstatement}{بیان‌مسئله}
\mydef{literature}{پیشینه‌تحقیق}
\mydef{method}{راه‌حل‌پیشنهادی}
\mydef{evaluation}{ارزیابی}
\mydef{writingthesis}{نگارش‌پایان‌نامه}
\mydef{obstacles}{مشکلات}
\mydef{submittedarticles}{مقالات‌ارسالی}
\mydef{schedule}{وضعیت‌زمان‌بندی}
\mydef{future}{کارهای‌آینده}

\logo{logo.pdf}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\makedoublespace{
\qquad\qquad
}

\def\makefullpage{
\thispagestyle{empty}
\newgeometry{ignoreall=true, includeheadfoot=false, marginparwidth=0cm, marginparsep=0cm, textwidth=202mm, headheight=0cm, headsep=0cm, top=3mm, bottom=5mm, right=0.5cm, left=0.5cm}
}

\def\makelevelbox{
\begin{mdframed}[roundcorner=10pt, needspace=0mm, rightmargin=2cm, leftmargin=2cm, innertopmargin=1mm, innerbottommargin=1mm, align=center, innerrightmargin=5mm, innerleftmargin=2mm]
{
\textbf{\centering گزارش پیشرفت تحصیلی پایان‌نامه دانشجویان گروه مهندسی سیستم‌های نرم‌افزاری دانشگاه اصفهان}
}
\\
%\vspace{-4mm}
\centering
 دکتری  
\ifnum \pdf@strcmp{\@level}{دکتری} = 0
\SquareSolid
\else 
\Square
\fi
 \qquad \qquad
 کارشناسی ارشد
\ifnum \pdf@strcmp{\@level}{کارشناسی ارشد} = 0
\SquareSolid
\else 
\Square
\fi

\end{mdframed}
}
\def\makesupervisorbox#1{
\vspace{-2mm}
\begin{mdframed}

\شروع{شمارش}
\مورد {ارزیابی استاد راهنما در خصوص پیشرفت تحقیق مطابق جدول زمانبندی و اجرای تحقیق براساس سئوالات و فرضیات و اهداف تحقیق:}
\vspace{30pt}
\مورد خلاصه پیشنهادات برای بهبود پیشرفت كار پایان‌نامه :
\vspace{30pt}
\پایان{شمارش}

\شروع{چپ‌چین} 
\begin{tabular}{p{2cm}p{2cm}p{4cm}p{2cm}}
تاریخ: & &
\centering{امضا استاد راهنما} & \\
& &
\centering{ دکتر #1} &
\end{tabular}
\پایان{چپ‌چین}
\vspace{10pt}

\end{mdframed}
}

\def\mantitle{
\ifnum \pdf@strcmp{\@secsupervisor}{} = 0
جناب آقای
\else
جناب آقایان
\fi
}
\def\supertitle{
\ifnum \pdf@strcmp{\@suptitle}{} = 0
\mantitle
\else
\@suptitle
\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% صفحه عنوان

\def\maketitlepage{
\makefullpage
\begin{center}
بسمه‌تعالی\\
\includegraphics[scale=.5]{\@logo}\\
\vspace{-1mm}
\textbf{‫مدیریت تحصیلات تکمیلی‬}\\
\vspace{-2mm}
\makelevelbox
\end{center}
گزارش شماره: 
 \textbf{\@reportno}
\\
\textbf{الف: (توسط دانشجو تکمیل شود)}
\vspace{-2mm}
\begin{mdframed}
%student
\noindent استاد(ان) راهنمای محترم:  \textbf{\supertitle \  دکتر \@supervisor
\ifnum \pdf@strcmp{\@secsupervisor}{} = 0
\else
 \ و دکتر \@secsupervisor
\fi
}
\\
با سلام، \\
گزارش پیشرفت تحصیلی پایان‌نامه اینجانب از تاریخ \@reportstartdate تا تاریخ \@reportenddate به مدت \@reportduration\ به شرح ذیل به استحضار می‌رسد. \\
نام و نام خانوادگی دانشجو:
\textbf{\@student}  \quad
شماره دانشجوئی:
\textbf{\@stno} \quad
رشته:
\textbf{\@field} \quad
گرایش:
\textbf{\@subfield}

\end{mdframed}
\vspace{-4mm}
\begin{mdframed}
عنوان پایان‌نامه:
\quad \textbf{\@farsititle } \\
تاریخ تصویب نهایی: 
\qquad \textbf{\@proposaldate } \\
تاریخ مورد انتظار دفاع:
\quad \textbf{\@defencedate }
\end{mdframed}
\vspace{-4mm}
\begin{mdframed}
\شروع{شمارش}
[series=progress, leftmargin=0cm, itemindent=.5cm]



\مورد{پیشرفت کار پایان‌نامه طی دوره گذشته:}
{\@workprogress}
\مورد {میزان پیشرفت:}{
بیان مسئله  
\@problemstatement،\quad
پیشینه تحقیق 
\@literature،\quad
راه‌حل پیشنهادی 
\@method،\quad
ارزیابی 
\@evaluation،\quad
نگارش پایان‌نامه
\@writingthesis
}
\مورد {مشکلات علمی-اجرائی و مالی در مسیر تحقیق:}
{\@obstacles}
\مورد {لیست مقالات علمی ارسالی که هنوز پذیرش نشده است:}
{\\\@submittedarticles}
\مورد {میزان تاخیر و یا تقدم براساس برنامه اولیه:}
{\@schedule}
\پایان{شمارش}
\end{mdframed}
\vspace{-4mm}
\begin{mdframed}

\شروع{شمارش}
[resume=progress, leftmargin=0cm, itemindent=.5cm]
\مورد {خلاصه فعالیت‌های موردنظر برای دوره آینده:}
{\@future}
\پایان{شمارش}

\شروع{چپ‌چین} 
امضاء دانشجو
\makedoublespace \makedoublespace

\پایان{چپ‌چین}
\vspace{10pt}
\end{mdframed}
\pagebreak
\vspace*{10pt}
\textbf{ب: (توسط استاد یا استادان راهنما تكمیل شود)}
\makesupervisorbox{\@supervisor}
\ifnum \pdf@strcmp{\@secsupervisor}{} = 0
\else
\makesupervisorbox{\@secsupervisor}
\fi

\textbf{ج : ( توسط گروه تكمیل شود)}
\begin{mdframed}
\Square \quad به علت عدم پیشرفت مناسب در شورای تحصیلات تكمیلی گروه مطرح شود. \\
\Square \quad   در پرونده دانشجو بایگانی شود.
\vspace{10pt}
\شروع{چپ‌چین} 
\begin{tabular}{p{2cm}p{2cm}p{4cm}p{2cm}}
تاریخ: & &
\centering{امضا مدیر گروه یا نماینده تحصیلات تكمیلی} &
\end{tabular}
\پایان{چپ‌چین}
\vspace{10pt}
\end{mdframed}
\restoregeometry
}