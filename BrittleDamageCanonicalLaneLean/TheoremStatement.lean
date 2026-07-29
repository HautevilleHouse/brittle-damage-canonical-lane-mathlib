import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure BrittleDamageAdmittedObject where
  carrier : Type
  sufficientConditions : Prop
  conclusion : conclusion

def BrittleDamageWitnessClosed (O : BrittleDamageAdmittedObject) : Prop :=
  O.sufficientConditions

end BrittleDamageCanonicalLaneLean
end HautevilleHouse