---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: basic
title: Research
---

<ul class="post-list">
  {% assign research_pages = site.research | sort: 'navigation_weight' %}
  {%- for page in research_pages -%}
  <li>
	<h2>
	  <a class="post-link" href="{{ page.url | relative_url }}">
		{{ page.title | escape }}
	  </a>
	</h2>
	<div class="excerpt">
    {{ page.excerpt }}
	</div>
	<!-- <p class="clearwrap"></p> -->
	  

  </li>
  {%- endfor -%}
</ul>
