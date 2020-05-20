# 〜〜〜〜〜パンくず親〜〜〜〜〜
crumb :root do
  link "メルカリ", root_path
end

# 〜〜〜〜〜パンくず子供エリア〜〜〜〜

# カテゴリー一覧ページ
crumb :categories do
  link 'カテゴリー一覧', categories_path
  parent :root
end

# マイページ
crumb :show do
  link "マイページ", user_path(id: current_user.id)
  parent :root
end

# プロフィール
crumb :edit do 
  link "プロフィール", edit_user_path
  parent :show
end

# 出品中
crumb :exhibiting do 
  link "出品中", exhibiting_users_path
  parent :show
end

# 本人情報の登録
crumb :edit_personal do 
  link "本人情報の登録", edit_personal_path
  parent :show
end

# 支払い方法
crumb :card do 
  link "支払い方法", card_users_path
  parent :show
end

# ログアウト
crumb :logout do 
  link "ログアウト", logout_users_path
  parent :show
end

# 商品詳細ページ
crumb :items_name do
  #該当のidの情報を１件だけ取得する
  @item = Item.find(params[:id])
  # @item.name = 商品名
  link @item.name, item_path
end

crumb :items_name2 do
  #該当のidの情報を１件だけ取得する
  @item = Item.find(params[:id])
  # @item.name = 商品名
  link "出品詳細画面", item_path
  parent :exhibiting
end

# 検索結果ページ
crumb :items_search do 
  @q = Item.search(params[:q])
  # 検索した文字だけを表示できるように@qの後ろにname_contをつける
  link @q.name_cont, root_path
end

# カテゴリー詳細ページ
crumb :category_show do
  @category = Category.find(params[:id])
  if @category.ancestry
    if @category.children.present?
      # 子供カテゴリーは
      link @category.parent.name, category_path(@category.parent_id)
    else
      # 孫カテゴリーは
      link @category.parent.parent.name, category_path(@category.parent.parent_id)
    end
  else
    # 親カテゴリーは
    link @category.name, category_path(params[:id])
  end
    parent :categories
end

crumb :childCategory do
  @category = Category.find(params[:id])
  if @category.children.present?
    # 子供カテゴリーは
    link @category.name, category_path(params[:id])
  else
    # 孫カテゴリーは
    link @category.parent.name, category_path(@category.parent_id)
  end
  parent :category_show
end

crumb :grandchildCategory do
  @category = Category.find(params[:id])
  link @category.name, category_path(params[:id])
  parent :childCategory
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).