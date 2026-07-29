import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.CrackGrowth
import HautevilleHouse.BrittleDamageCanonicalLaneLean.GriffithEnergy

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

def ConstrainedBrittleDamageClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_brittle_damage_endgame (A : AdmissibleClass) :
    ConstrainedBrittleDamageClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse