# Copyright 2021-2025 The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

# Khronos overrides for Rouge 'github' theme CSS for accessibility.
# See (note that this code is evolving, works as of asciidoctor 2.0.12):
# https://github.com/asciidoctor/asciidoctor/blob/main/lib/asciidoctor/syntax_highlighter/rouge.rb

include ::Asciidoctor

class ExtendedRougeSyntaxHighlighter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'

  # Insert rouge stylesheet from super
  # Then replace many 'github' theme colors for accessibility compliance
  # It would be better to use rouge's stylesheet factory, if it has one
  def docinfo location, doc, opts
    overrides = %(<style>
/* Khronos overrides for Rouge 'github' theme for accessibility */
/* Basically everything is overridden, but it is unclear how to add a new Rouge theme */
/* Codelike overrides */
pre.rouge .cm, pre.rouge .cp, pre.rouge .c1, pre.rouge .cs,
pre.rouge .c, pre.rouge .ch, pre.rouge .cd, pre.rouge .cpf,
pre.rouge .gh, pre.rouge .bp {
  color: #aaaaaa;
}
/* Numberlike overrides */
pre.rouge .mf, pre.rouge .mh, pre.rouge .il, pre.rouge .mi,
pre.rouge .mo, pre.rouge .m, pre.rouge .mb, pre.rouge .mx {
  color: #00a8a8;
}
/* Namelike overrides */
pre.rouge .ne, pre.rouge .nf, pre.rouge .fm, pre.rouge .nl {
  color: #ff0f0f;
}
/* Other things ANDI warns about - unsure of their purposes */
pre.rouge .go, pre.rouge .gu {
  color: #b0b0b0;
}
pre.rouge .sr {
  color: #00ff00;
}
pre.rouge .na, pre.rouge .nb {
  color: #00cccc;
}
pre.rouge .no, pre.rouge .vc, pre.rouge .vg, pre.rouge .vi,
pre.rouge .nv, pre.rouge .vm {
  color: #00cccc;
}
pre.rouge .w {
  color: #b0b0b0;
}

/* Set the code block symbol-like */
pre.rouge .o {
  color: #4ae;
}

/* Set the code block type-like */
pre.rouge .kt {
  color: #DA5458;
}

/* Set the code block keyword-like */
pre.rouge .k {
  color: #E35270;
}

/* Set the code block Vulkan-struct-like */
pre.rouge .nc {
  color: #b77028;
}

</style>)

    # super can return either <style> or <link> markup, both work
    %(#{super}
#{overrides})
  end
end
