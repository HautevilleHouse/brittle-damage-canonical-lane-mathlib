import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BrittleDamageWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BrittleDamageCanonicalLaneLean
end HautevilleHouse