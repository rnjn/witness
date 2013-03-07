exports.index = function(req, res){
  res.render('index', { title: 'Express' });
};

exports.raw = function(req, res){
  res.render('raw', { title: 'Express' });
};
