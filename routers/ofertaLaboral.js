const express = require('express');
const router = express.Router();
const ofertaLaboralController = require('../controllers/ofertaLaboralController');


// rutas para la API de usuarios

router.get('/', (req, res, next) => {
   ofertaLaboralController.getAll(req, res);
});


router.delete('/remove', (req, res, next) => {
   ofertaLaboralController.remove(req, res);
});

router.post('/crearOferta', (req, res, next) => {
   ofertaLaboralController.crearOferta(req, res);
});

router.put('/updateOferta', (req, res, next) => {
   ofertaLaboralController.updateOferta(req, res);
});



module.exports = router;