import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure BrittleDamageObject where
  crack : Type u
  stressField : Type v
  criticalStress : Prop
  fractureToughness : Prop
  propagationCondition : Prop
  conclusion : propagationCondition

def BrittleDamageWitnessClosed (O : BrittleDamageObject) : Prop :=
  O.propagationCondition

end BrittleDamageCanonicalLaneLean
end HautevilleHouse