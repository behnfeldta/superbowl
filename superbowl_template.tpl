{% block output %}
{% if 'summary' in cell['metadata'].get('tags', []) %}
<div style="
    margin: 0;
    padding: 10px 10 10px 10;
    border: 0;
    vertical-align: baseline;
    color: white;
    background-color: black;
    border-radius: 0;
"
 {{ super() }}
</style>
    
{% elif 'subtitle' in cell['metadata'].get('tags', []) %}
<div style="    
    position: relative;
    color: #3a3a3a;
    left: 0;
    height: 20%;
    margin: 0mm;
    border-left: 5px solid #98151b;
    background: #ffffff;
"
 {{ super() }}
</style>
    
{% else %}

    {{ super() }}

{% endif %}
{% endblock output %}