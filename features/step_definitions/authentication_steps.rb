Given "a user visits the signin page" do
	visit signin_path
end

When "he submits invalid signin information" do
	click_button "Sign in"
end

Then "he should see an error message" do
	page.should have_selector('div.alert.alert-error')
end

Given "the user has an account" do
	@users = User.create(f_name: "Example", l_name: "User", email: "user@example.com",
	password: "foobar", password_confirmation: "foobar", address: "address", phone: "0123456789")
end

When "the user submits valid signin information" do
	fill_in "Email", with: @users.email
	fill_in "Password", with: @users.password
	click_button "Sign in"
end

Then "he should see his profile page" do
	page.should have_selector('title', text: @users.name)
end

Then "he should see a signout link" do
	page.should have_link('Sign out', href: signout_path)
end