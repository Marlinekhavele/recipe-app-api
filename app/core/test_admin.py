def test_users_listed(self):
    """Test that users are listed on the user page """
    url = reverse('admin:core_user_changelist')
    res = self.client.get(url)
    self.assertContains(res, self.user.name)
    self.assertContains(res, self.user.email)


def test_user_change_page(self):
    """Test that the user edit page works"""
    url = reverse('admin:core_user_change', args=[self.user.id])
    res = self.client.get(url)

    self.assertEqual(res.status_code, 200)


def test_create_user_page(self):
    """ Test that the create user page works"""
    url = reverse('admin:core_user_add')
    res = self.client.get(url)

    self.asertEqual(res.status_code,200)
