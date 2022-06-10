require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  setup do
    @article = articles(:minitest)
  end

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

  test "should edit an article without erros" do
    @article.title = "Test Title updated"
    @article.description = "Test Text updated"
    assert @article.valid?
    assert @article.save
  end

  test "should not edit an article with invalid name" do
    @article.title = ""
    @article.description = "Test Text updated"
    assert_not @article.valid?
    assert_not @article.save
  end

  test "should not edit an article with small lenght name" do
    @article.title = "test"
    @article.description = "Test Text updated"
    assert_not @article.valid?
    assert_not @article.save
  end

  test "should not edit an article with invalid description" do
    @article.title = "Test Title updated"
    @article.description = ""
    assert_not @article.valid?
    assert_not @article.save
  end

  test "should not edit an article with small leght description" do
    @article.title = "Test Title updated"
    @article.description = "small"
    assert_not @article.valid?
    assert_not @article.save
  end

  test "should retrieve 2 articles" do
    assert_equal 2, Article.count, "Retrieved more than 2 articles"	
  end

end