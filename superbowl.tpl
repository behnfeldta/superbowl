{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}


{%- block header -%}
<!DOCTYPE html>
<html>

<head>
{%- block html_head -%}
<meta charset="utf-8" />

{% set nb_title = nb.metadata.get('title', '') or resources['metadata']['name'] %}
<title>{{nb_title}}</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

{% block ipywidgets %}
{%- if "widgets" in nb.metadata -%}
<script>
(function() {
  function addWidgetsRenderer() {
    var mimeElement = document.querySelector('script[type="application/vnd.jupyter.widget-view+json"]');
    var scriptElement = document.createElement('script');
    var widgetRendererSrc = '{{ resources.ipywidgets_base_url }}@jupyter-widgets/html-manager@*/dist/embed-amd.js';
    var widgetState;

    // Fallback for older version:
    try {
      widgetState = mimeElement && JSON.parse(mimeElement.innerHTML);

      if (widgetState && (widgetState.version_major < 2 || !widgetState.version_major)) {
        widgetRendererSrc = '{{ resources.ipywidgets_base_url }}jupyter-js-widgets@*/dist/embed.js';
      }
    } catch(e) {}

    scriptElement.src = widgetRendererSrc;
    document.body.appendChild(scriptElement);
  }

  document.addEventListener('DOMContentLoaded', addWidgetsRenderer);
}());
</script>
{%- endif -%}
{% endblock ipywidgets %}

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<style type="text/css">
/* Overrides of notebook CSS for static HTML export */
body {


div#notebook {
  overflow: visible;
  border-top: none;
}

{%- if resources.global_content_filter.no_prompt-%}
div#notebook-container{
    position: relative;
    width: 210mm;
    min-height: 300mm;
    padding: 0mm;
    padding-top: 0mm;
    padding-right: 0mm;
    padding-bottom: 0mm;
    padding-left: 0mm;
    margin: 10mm auto;
    margin-top: 10mm;
    margin-right: auto;
    margin-bottom: 10mm;
    margin-left: auto;
    border-radius: 5px;
    background: white;
    box-shadow: 0 0 10px lightgrey;
}
{%- endif -%}

@media print {
  div.cell {
    display: block;
    page-break-inside: avoid;
    
  } 
  div.output_wrapper { 
    display: block;
    page-break-inside: avoid; 
  }
  div.output { 
    display: block;
    page-break-inside: avoid; 
  }
}
</style>


<!-- Custom stylesheet, it must be in the same directory as the html file -->
<link rel="stylesheet" href="custom.css">

<!-- Loading mathjax macro -->

{{ mathjax() }}
{%- endblock html_head -%}
</head>
{%- endblock header -%}

{% block body %}
<body>

  <div tabindex="-1" id="notebook" class="border-box-sizing">
  
    <div class="container" id="notebook-container">
    <img src="superb_owl_logo.png" style="height: 30px; width:auto; margin: 25px;margin-top: 25px; margin-right: 25px; margin-bottom: 25px; margin-left: 25px;">

{{ super() }}
    </div>
  </div>
</body>
<style>
body {
    width: 100%;
    height: 100%;
    margin: 0;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    padding: 0;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    background-color: #fafafa;
    font-size: 1.1rem;
    line-height: 1.3;
    font-weight: 400;
    font-family: "Raleway", "HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;
    color: #222;
    }

div.output_area pre {
    margin: 0;
    padding: 1px 0 1px 0;
    border: 0;
    vertical-align: baseline;
    color: black;
    background-color: transparent;
    border-radius: 0;
    margin-bottom: 35px;

}

.jupyter-widgets {
  border: none;
  }

.p-Collapse-header {
    background-color: #962626;
    color: var(--jp-ui-font-color0);
    cursor: default;
    border-bottom: none;
}

#notebook-container {    position: relative;
    width: 210mm;
    min-height: 300mm;
    padding: 0mm;
    padding-top: 0mm;
    padding-right: 0mm;
    padding-bottom: 0mm;
    padding-left: 0mm;
    margin: 10mm auto;
    margin-top: 10mm;
    margin-right: auto;
    margin-bottom: 10mm;
    margin-left: auto;
    border-radius: 5px;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    border-bottom-left-radius: 5px;
    background: white;
    background-image: initial;
    background-position-x: initial;
    background-position-y: initial;
    background-size: initial;
    background-repeat-x: initial;
    background-repeat-y: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: white;
    box-shadow: 0 0 10px lightgrey;}

.jupyter-widgets.widget-tab > .p-TabBar .p-TabBar-tab.p-mod-current {
    color: var(--jp-ui-font-color0);
    background: transparent;
    background-color: white;
    overflow: none;
    border-style: none;
    border-color: #962626;
    border-bottom-style: none;
    border-top-style: none;
    border-right-style: none;
    border-left-style: solid;
    border-left-width: thick;
    padding: 5px 10px;
}

.jupyter-widgets.widget-tab > .p-TabBar .p-TabBar-tab {
    color: var(--jp-ui-font-color0);
    background: transparent;
    background-image: initial;
    background-position-x: initial;
    background-position-y: initial;
    background-size: initial;
    background-repeat-x: initial;
    background-repeat-y: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: white;
    min-height: calc(var(--jp-widgets-horizontal-tab-height) + 2 * var(--jp-border-width));
    transform: translateY(var(--jp-border-width));
    overflow: visible;
    border-style: none;
    border-color: #962626;
    border-bottom-style: none;
    border-top-style: none;
    border-right-style: none;
    border-left-style: solid;
    border-left-width: thick;
    padding: 5px 10px;
}

.jupyter-widgets.widget-tab > .p-TabBar .p-TabBar-tab.p-mod-current:before {
  content: none;
}

.jupyter-widgets.widget-tab > .widget-tab-contents {
    border: none;
}

}
</style>



{%- endblock body %}

{% block footer %}
{{ super() }}
</html>
{% endblock footer %}


