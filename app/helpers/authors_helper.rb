module AuthorsHelper
  def author_email(author)
    author.email if author && author.email.present?
  end
end