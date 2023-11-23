from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import json
from django.http import JsonResponse
# Create your views here.
def index(request):
    return render(request,'index.html')


#403 csrf 에러 방지
@csrf_exempt
def getSummaries(request):
    if request.method == 'POST':
        receive_data = json.loads(request.body)
        print(receive_data)

    data = [{'summary': 'success1'} , {'summary': 'success2'},{'summary': 'success3'}]
    # json형태로 리턴
    # 이름에서 알 수 있듯이JsonResponse는 JSON 응답을 만드는 데 사용됩니다.
    # 이 클래스의 생성자는 Python 딕셔너리 사전을 매개 변수로 받아들이고 해당 딕셔너리 사전을 기반으로 JSON 응답을 생성합니다.
    #TypeError: In order to allow non-dict objects to be serialized set the safe parameter to False.
    return JsonResponse(data, safe=False)
    #return "{ \"data\" :[{\"summary\":\"success1\" },{\"summary\":\"success2\" }, {\"summary\":\"success3\"}] }"
