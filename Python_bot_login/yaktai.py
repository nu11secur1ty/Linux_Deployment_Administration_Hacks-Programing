from selenium import webdriver


def loginBOT(usr, pas):
	br = webdriver.Firefox()
	br.get("https://web.facebook.com/")

	user = br.find_element_by_css_selector("#email")
	user.clear()
	user.send_keys(usr)

	passwd = br.find_element_by_css_selector("#pass")
	passwd.clear()
	passwd.send_keys(pas)

	btn = br.find_element_by_css_selector("#u_0_5")
	btn.click()


if __name__ == "__main__":
	loginBOT('username or email', 'yourpassword')
