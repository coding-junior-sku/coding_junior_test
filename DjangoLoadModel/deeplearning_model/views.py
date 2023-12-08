from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import json
from django.http import JsonResponse
import sys
import requests

# Create your views here.
def index(request):
    return render(request,'index.html')


#403 csrf 에러 방지
@csrf_exempt
def getSummaries(request):
    if request.method == 'POST':
        receive_datas = json.loads(request.body)
        print(receive_datas)
        #요약 기사들을 담을 리스트
        sendData=[]
        
        for receive_data in receive_datas:
            #발급 받은 naver clova key값
            client_id = "zemjau9ajl"
            client_secret = "yagCiP3afCqySkC8ViSN9qDtjE2tCllfmrKq45px"
            headers = {
                "X-NCP-APIGW-API-KEY-ID": client_id,
                "X-NCP-APIGW-API-KEY": client_secret,
                "Content-Type": "application/json"
            }
            language = "ko"  # Language of document (ko, ja )
            model = "news"  # Model used for summaries (general, news)
            tone = "2"  # Converts the tone of the summarized result. (0, 1, 2, 3)
            summaryCount = "3"  # This is the number of sentences for the summarized document.
            url = "https://naveropenapi.apigw.ntruss.com/text-summary/v1/summarize"
            title = "뉴스 요약"

            content = receive_data['description']
            print(content)

            data = {
                "document": {
                    "title": title,
                    "content": content
                },
                "option": {
                    "language": language,
                    "model": model,
                    "tone": tone,
                    "summaryCount": summaryCount
                }
            }

            #return 해줄때는
            #json형태로!     (dict -> str)
            #json.dumps(변수)
            print(json.dumps(data, indent=4, sort_keys=True))
            response = requests.post(url, data=json.dumps(data), headers=headers)
            rescode = response.status_code
            if (rescode == 200):
                print(response.text)

                #[ERROR] TypeError: string indices must be integers (aws lambda, api gateway)
                #print(response.text["summary"])
                #json형태를 띈 str 타입을 dict로 변환!!!  (str -> dict)
                #json.loads(변수)
                getSummaryDict=json.loads(response.text)
                getSummary=getSummaryDict["summary"]
                print(getSummary)
            else:
                print("Error : " + response.text)

            sendData.append({"summary":getSummary})

            #summary안에 summary가 들어간 구조가 됨
            #sendData.append({'summary':response.text})

            # 애초에 response.text 자체가  {"summary":""} 형식으로 와서 또 키 를 넣어줄 필요가 없다.
            #"{\"summary\":\"OPECOPEC러시아가 전일 자발적 감산을 발표했지만 국제유가는 2 이상 급락했습니다.\\n이는 전일 OPEC가 일일 100만 배럴의 추가 감산을 발표했지만 자발적 감산이어서 회원국간 약속이 지켜지지 않을 것이란 전망 때문으로 풀이됩니다.\\n전일 OPEC는 추가로 일일 100만 배럴 모두 220만 배럴의 감산을 선언했으나 자발적 감산이라고 밝혔습니다.\"}"
            #근데 이러면 이 데이터를 받는 곳에서 jsonobject로 인식을 못함 왜?
            #{"summary": ""} 이 자체를 키값에 넣는데 문자열로 인식해서 따옴표 추가해서 그런거같다
            #sendData.append(response.text)


    #data = [{'summary': 'success1'} , {'summary': 'success2'},{'summary': 'success3'}]
    # json형태로 리턴
    # 이름에서 알 수 있듯이JsonResponse는 JSON 응답을 만드는 데 사용됩니다.
    # 이 클래스의 생성자는 Python 딕셔너리 사전을 매개 변수로 받아들이고 해당 딕셔너리 사전을 기반으로 JSON 응답을 생성합니다.
    #TypeError: In order to allow non-dict objects to be serialized set the safe parameter to False.
    return JsonResponse(sendData, safe=False)

    #return "{ \"data\" :[{\"summary\":\"success1\" },{\"summary\":\"success2\" }, {\"summary\":\"success3\"}] }"
