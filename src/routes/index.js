const { addAdmin, updateAmin } = require('../controllers/admin.controller');

const router = require('express').Router();

router.get('/admin', async (req, res, next) => {
  addAdmin(res, req, { message: 'hello' });
});

router.get('/admin/update', async (req, res, next) => {
  updateAmin(res, req, { message: 'Update' });
});

module.exports = router;
