import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure FractureObject where
  material : Type
  stressTensor : Type
  crackDensity : Type
  principalFracture : Prop

structure AdmittedObject where
  object : FractureObject
  damageCriterionSatisfied : Prop
  residualStrengthPos : Prop
  gateWitness : damageCriterionSatisfied ∨ residualStrengthPos

end BrittleDamageCanonicalLaneLean
end HautevilleHouse