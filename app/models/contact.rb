class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha => true

  def headers
    {
      :subject => "Nouvelle demande sur votre site",
      :to => "dania.af@hotmail.fr",
      :from => %{"#{name}" <#{email}>}
    }
  end
end
