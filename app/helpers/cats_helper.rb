module CatsHelper
  def cat_box(cat)
    html = <<-HTML
    <section class="cat-box-container">
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
    </section>

    HTML

    html.html_safe
  end
end
