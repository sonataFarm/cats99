module CatsHelper
  def cat_box(cat)
    html = <<-HTML
      <a href="#{cat_url(cat)}">
        <section class="cat-box">
          <section class="image-container">
            <img src="#{cat.selfie}" />
          </section>
          <section class="text">
            #{cat.name}
          </section>
        </section>
      </a>
    HTML

    html.html_safe
  end
end
