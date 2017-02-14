(* This file is for reproducing the SMT typing issue in fix_base_vgs.

   This issue is now fixed
     (Imandra Core commit 514028d1aa1211ec060b72eb16f51726a917393c).

   Now that the issue is closed, we shall soon delete
    - this file (fix_err.ml), and
    - fix_base_vgs_err.ml.

   But, we're committing them to the repository in case we need to revisit
   this issue later.

 *)

:l fix_data_dictionary.ml
:l imarkets.ml
:l fix_engine.ml

:l fix_base_vgs_err.ml
