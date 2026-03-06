local U = require("utils.ts_utils")
local in_text = U.in_text
local in_math = U.in_math

local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    {
      trig = "begin",
      desc = "general begin environment",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\begin{<>}[<>]\n<>\n\\end{<>}", {
      i(1),
      i(2),
      i(0),
      f(function(args)
        return args[1][1]
      end, { 1 }),
    })
  ),
  s(
    {
      trig = "ss",
      desc = "\\section",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\section{<>}\n<>\n", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "sse",
      desc = "\\subsection",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\subsection{<>}\n<>\n", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "sss",
      desc = "\\subsubsection",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\subsubsection{<>}\n<>\n", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "para",
      desc = "\\paragraph",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\paragraph{<>}\n<>\n", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "sp",
      desc = "\\subparagraph",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\subparagraph{<>}\n<>\n", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "tit",
      desc = "\\textit",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textit{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "emp",
      desc = "\\emph",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\emph{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "und",
      desc = "\\underline",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\underline{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "sc",
      desc = "\\textsc",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textsc{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "tbf",
      desc = "\\textbf",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textbf{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "tcolor",
      desc = "\\textcolor",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textcolor{<>}{<>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    {
      trig = "tt",
      desc = "\\texttt",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\texttt{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "ref",
      desc = "\\ref",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\ref{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "eq",
      desc = "\\eqref",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\eqref{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "cite",
      desc = "\\cite",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\cite{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "citp",
      desc = "\\citep",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\citep{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "citt",
      desc = "\\citet",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\citet{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "label",
      desc = "\\label",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\label{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "fn",
      desc = "\\footnote",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\footnote{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s({
    trig = "itemize",
    desc = "itemize environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{itemize}\n\t\\item <>\n\t\\item <>\n\\end{itemize}<>", {
      i(1),
      i(2),
      i(0),
    })),
  s({
    trig = "enumerate",
    desc = "enumerate environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{enumerate}\n\t\\item <>\n\t\\item <>\n\\end{enumerate}<>", {
      i(1),
      i(2),
      i(0),
    })),
  s({
    trig = "description",
    desc = "description environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{description}\n\t\\item[<>] <>\n\\end{description}<>", {
      i(1),
      i(2),
      i(0),
    })),
  s({
    trig = "item",
    desc = "\\item",
    wordTrig = true,
    condition = in_text,
  }, {
    t("\\item "),
  }),
  s(
    {
      trig = "titv",
      desc = "visual -> \\textit{}",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textit{<>}<>", {
      d(1, get_visual),
      i(0),
    })
  ),
  s(
    {
      trig = "tbfv",
      desc = "visual -> \\textbf{}",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textbf{<>}<>", {
      d(1, get_visual),
      i(0),
    })
  ),
  s(
    {
      trig = "tcolorv",
      desc = "visual -> \\textcolor{}{}",
      wordTrig = true,
      condition = in_text,
    },
    fmta("\\textcolor{<>}{<>}<>", {
      i(1),
      d(2, get_visual),
      i(0),
    })
  ),
  s({
    trig = "fig",
    desc = "figure environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{figure}[<>]\n\t\\centering\n\t\\includegraphics[<>]{<>}\n\t\\caption{<>}\n\t\\label{<>}\n\\end{figure}<>", {
      i(1, "h!"),
      i(2, "width=0.8\\textwidth"),
      i(3),
      i(4),
      i(5),
      i(0),
    })),
  s({
    trig = "tab",
    desc = "table environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{table}[<>]\n\t\\centering\n\t\\begin{tabular}{<>}\n\t\t<>\n\t\\end{tabular}\n\t\\caption{<>}\n\t\\label{<>}\n\\end{table}<>", {
      i(1, "h!"),
      i(2, "c c"),
      i(3, "top & mid & bottom \\\\\n1 & 2 & 3"),
      i(4),
      i(5),
      i(0),
    })),
  s({
    trig = "inc",
    desc = "\\includegraphics",
    wordTrig = true,
    condition = in_text,
  }, fmta("\\includegraphics[<>]{<>}<>", {
    i(1, "width=0.8\\textwidth"),
    i(2),
    i(0),
    })),
  s({
    trig = "doc",
    desc = "document class",
    wordTrig = true,
    condition = in_text,
  }, fmta("\\documentclass[<>]{<>}\n\n<>\n\n\\begin{document}\n\t<>\n\\end{document}", {
    i(1, "12pt"),
    i(2, "article"),
    i(3, "\\usepackage{...}"),
    i(0),
    })),
  s({
    trig = "title",
    desc = "\\title",
    wordTrig = true,
    condition = in_text,
  }, fmta("\\title{<>}\n\\author{<>}\n\\date{<>}<>", {
    i(1),
    i(2),
    i(3, "\\today"),
    i(0),
    })),
  s({
    trig = "maketitle",
    desc = "\\maketitle",
    wordTrig = true,
    condition = in_text,
  }, t("\\maketitle")),
  s({
    trig = "abs",
    desc = "abstract environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{abstract}\n\t<>\n\\end{abstract}<>", {
      i(1),
      i(0),
    })),
  s({
    trig = "pkg",
    desc = "\\usepackage",
    wordTrig = true,
    condition = in_text,
  }, fmta("\\usepackage{<>}<>", {
    i(1),
    i(0),
    })),
  s({
    trig = "pkgopt",
    desc = "\\usepackage with options",
    wordTrig = true,
    condition = in_text,
  }, fmta("\\usepackage[<>]{<>}<>", {
    i(1),
    i(2),
    i(0),
    })),
  s({
    trig = "verb",
    desc = "verbatim environment",
    wordTrig = true,
    condition = in_text,
  }, fmta(
    "\\begin{verbatim}\n\t<>\n\\end{verbatim}<>", {
      i(1),
      i(0),
    })),
}
