require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should save article without erros" do
    article = Article.new(title: "Test Title", description: "Test Text Description")
    assert article.save
  end
  
  test "should not save article without title and description" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end  
  
  test "should not save article without title" do
    article = Article.new
    article.description = "some description"
    assert_not article.save, "Saved the article without a title"
  end 

  test "should not save article with title lenght less than 5" do
    article = Article.new
    article.title = "Test"
    article.description = "some description"
    assert_not article.save, "Saved the article with small title"
  end

  test "should not save article without description" do
    article = Article.new
    article.title = "some title"
    assert_not article.save, "Saved the article without a description"
  end
  
  test "should not save article with description title lenght less than 10" do
    article = Article.new
    article.title = "some title"
    article.description = "Test"
    assert_not article.save, "Saved the article with small description"
  end


end