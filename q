
[1mFrom:[0m /usr/local/rvm/gems/ruby-2.3.0/gems/actionpack-5.1.1/lib/action_dispatch/journey/router.rb @ line 48 ActionDispatch::Journey::Router#serve:

    [1;34m32[0m: [32mdef[0m [1;34mserve[0m(req)
    [1;34m33[0m:   find_routes(req).each [32mdo[0m |match, parameters, route|
    [1;34m34[0m:     set_params  = req.path_parameters
    [1;34m35[0m:     path_info   = req.path_info
    [1;34m36[0m:     script_name = req.script_name
    [1;34m37[0m: 
    [1;34m38[0m:     [32munless[0m route.path.anchored
    [1;34m39[0m:       req.script_name = (script_name.to_s + match.to_s).chomp([31m[1;31m"[0m[31m/[1;31m"[0m[31m[0m)
    [1;34m40[0m:       req.path_info = match.post_match
    [1;34m41[0m:       req.path_info = [31m[1;31m"[0m[31m/[1;31m"[0m[31m[0m + req.path_info [32munless[0m req.path_info.start_with? [31m[1;31m"[0m[31m/[1;31m"[0m[31m[0m
    [1;34m42[0m:     [32mend[0m
    [1;34m43[0m: 
    [1;34m44[0m:     req.path_parameters = set_params.merge parameters
    [1;34m45[0m: 
    [1;34m46[0m:     status, headers, body = route.app.serve(req)
    [1;34m47[0m: 
 => [1;34m48[0m:     [32mif[0m [31m[1;31m"[0m[31mpass[1;31m"[0m[31m[0m == headers[[31m[1;31m"[0m[31mX-Cascade[1;31m"[0m[31m[0m]
    [1;34m49[0m:       req.script_name     = script_name
    [1;34m50[0m:       req.path_info       = path_info
    [1;34m51[0m:       req.path_parameters = set_params
    [1;34m52[0m:       [32mnext[0m
    [1;34m53[0m:     [32mend[0m
    [1;34m54[0m: 
    [1;34m55[0m:     [32mreturn[0m [status, headers, body]
    [1;34m56[0m:   [32mend[0m
    [1;34m57[0m: 
    [1;34m58[0m:   [32mreturn[0m [[1;34m404[0m, { [31m[1;31m"[0m[31mX-Cascade[1;31m"[0m[31m[0m => [31m[1;31m"[0m[31mpass[1;31m"[0m[31m[0m }, [[31m[1;31m"[0m[31mNot Found[1;31m"[0m[31m[0m]]
    [1;34m59[0m: [32mend[0m

