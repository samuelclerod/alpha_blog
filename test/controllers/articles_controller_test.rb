class ArticlesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @article = articles(:minitest)
  end

  test "should get articles index" do
    get articles_url
    assert_equal "index", @controller.action_name
    assert_match "Articles", @response.body
    # assert_match @article.title, @response.body
    assert_response :success
  end

  test "should show article" do
    get articles_url(@article)
    assert_response :success
  end

  test "should add a new article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { title: "Test Title", description: "Test Text Description" } }
    end
    assert_redirected_to article_url(Article.last)
  end

  test "should not add a new article" do
    assert_no_difference('Article.count') do
      post articles_url, params: { article: { title: "", description: "" } }
    end
    assert_response :success
  end

  test "should delete an article" do 
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end
    assert_redirected_to articles_url
  end

  test "should update an article" do
    patch article_url(@article), params: { article: { title: "Test Title updated", description: "Test Text updated" } }
    assert_redirected_to article_url(@article)
  end

  test "should not update an article" do
    patch article_url(@article), params: { article: { title: "", description: "" } }
    assert_response :success
  end

end