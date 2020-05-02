---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: basic
title: Research
---

<ul class="post-list">
  {%- for page in site.research -%}
  <li>
	<h3>
	  <a class="post-link" href="{{ page.url | relative_url }}">
		{{ page.title | escape }}
	  </a>
	</h3>
	  {{ page.excerpt }}
  </li>
  {%- endfor -%}
</ul>
